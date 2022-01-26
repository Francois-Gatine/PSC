# requirements :
#     Python 3.6
<<<<<<< HEAD
#     PyTorch 1.6.0 : an optimized tensor library
#     transformers 4.6.0 : it provides thousands of pretrained models and is backed by the three most popular deep learning libraries — Jax, PyTorch and TensorFlow

=======
#     PyTorch 1.6.0 :pip3 install torch==1.10.1+cu102 torchvision==0.11.2+cu102 torchaudio===0.10.1+cu102 -f https://download.pytorch.org/whl/cu102/torch_stable.html an optimized tensor library
#     transformers 4.6.0 :pip install transformers it provides thousands of pretrained models and is backed by the three most popular deep learning libraries — Jax, PyTorch and TensorFlow
#     pip install -U sentence-transformers
>>>>>>> 707a0d2ae7d9c1e5621af1bc892f635516e9394e



# We will use the SPECTER model accessible through HuggingFace's transformers library.
# reasons for choosing this model among others: "SPECTER is a model trained on scientific citations and can be used to estimate the similarity of two publications. We can use it to find similar papers."

from transformers import AutoTokenizer, AutoModel
<<<<<<< HEAD

#                                  WARNING
#the following three lines should be done once !
load model and tokenizer
=======
from sentence_transformers import util

#                                  WARNING
#the following two lines should be done once !
#load model and tokenizer
>>>>>>> 707a0d2ae7d9c1e5621af1bc892f635516e9394e
tokenizer = AutoTokenizer.from_pretrained('allenai/specter')
model = AutoModel.from_pretrained('allenai/specter')

papers = ["ICONBM: INTERNATIONAL CONFERENCE ON BIOMASS, PTS 1 AND 2", "Comparison in Dimethyl Ether Steam Reforming of Conventional Cu-ZnO-Al2O3 and Supported Pt Metal Catalysts"]
# preprocess the input
inputs = tokenizer(papers, padding=True, truncation=True, return_tensors="pt", max_length=512)
# computing the embedding
result = model(**inputs)
# take the first token in the batch as the embedding
embeddings = result.last_hidden_state[:, 0, :]
# computing the cosine similarity between the two titles
cos_sim = util.cos_sim(embeddings[0], embeddings[1])
<<<<<<< HEAD
print("Cosine-Similarity:", cos_sim)
=======
print("Cosine-Similarity:", cos_sim)

>>>>>>> 707a0d2ae7d9c1e5621af1bc892f635516e9394e
