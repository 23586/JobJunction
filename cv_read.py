#jobs content based filtering
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.preprocessing import MinMaxScaler
import nltk
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
import re
from pdfminer.high_level import extract_text
import sys

# Download NLTK resources
# nltk.download('punkt')
# nltk.download('wordnet')
# nltk.download('stopwords')

# Function to extract text from PDF
def extract_text_from_pdf(pdf_path):
    return extract_text(pdf_path)

# Advanced text preprocessing function
def preprocess_text(text):
    lemmatizer = WordNetLemmatizer()
    words = nltk.word_tokenize(text.lower())
    words = [lemmatizer.lemmatize(word) for word in words if word.isalpha() and word not in stopwords.words('english')]
    return ' '.join(words)

# Path to the CV and job listings CSV
cv_file_path = sys.argv[1].strip()
job_listings_csv_path ='IT_Data.csv'

# Extract and preprocess CV text
cv_text = extract_text_from_pdf(cv_file_path)
cv_text_processed = preprocess_text(cv_text)

# Read and preprocess job listings
jobs_df = pd.read_csv(job_listings_csv_path)
jobs_df['combined_details'] = jobs_df['Job Name'] + " " + jobs_df['JD']
jobs_df['combined_details'] = jobs_df['combined_details'].apply(preprocess_text)

# Combine all texts for TF-IDF
all_texts = jobs_df['combined_details'].tolist() + [cv_text_processed]

# Create and configure TF-IDF Vectorizer
vectorizer = TfidfVectorizer(max_df=0.85, min_df=2, ngram_range=(1,2))
tfidf_matrix = vectorizer.fit_transform(all_texts)
cosine_sim = cosine_similarity(tfidf_matrix[-1:], tfidf_matrix[:-1])

# Add similarity scores to the DataFrame
jobs_df['similarity_score'] = cosine_sim.flatten()

# Get top 5 job recommendations
jobs_df.sort_values(by='similarity_score', ascending=False,inplace=True)

jobs_df.drop_duplicates(['Job Name'],inplace=True)

scaler = MinMaxScaler(feature_range=(0, 1))  # Scaling between 0 and 1
jobs_df['similarity_score'] = scaler.fit_transform(jobs_df[['similarity_score']])
jobs_df=jobs_df[jobs_df['similarity_score']>0.1]
print(jobs_df['similarity_score'].mean())
recommended_jobs=jobs_df[jobs_df['similarity_score']>(jobs_df['similarity_score'].mean()+jobs_df['similarity_score'].quantile(0.75)+0.05)]

recommended_jobs.reset_index(drop=True,inplace=True)

recommended_jobs=recommended_jobs.rename(columns={'Experience Required':'Experience','Job Name':'JobName'})
# Display recommended jobs
recommended_jobs.to_excel('Desktop/Recommended Jobs.xlsx',index=False)