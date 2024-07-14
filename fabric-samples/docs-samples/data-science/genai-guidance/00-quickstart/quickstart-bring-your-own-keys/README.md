# Building Retrieval Augmented Generation in Fabric: A Step-by-Step Guide

Large Language Models (LLMs) such as OpenAI's ChatGPT are powerful tools, but their effectiveness for business applications and meeting customer needs greatly improves when customized with specific data using Generative AI (GenAI) solutions. Without this customization, LLMs may not deliver optimal results tailored to the requirements and expectations of businesses and their customers. 

One straightforward approach to enhance the results is to manually integrate specific information into prompts. For more advanced improvements, fine-tuning LLMs with custom data proves effective. This notebook demonstrates the Retrieval Augmented Generation (RAG) strategy, which supplements LLMs with dynamically retrieved and relevant information (e.g., business-specific data) to enrich their knowledge.

Implementing RAG involves methods such as web searching or utilizing specific APIs. An effective approach is utilizing a Vector Search Index to efficiently explore unstructured text data. The Vector Index searches through a database of text chunks and ranks them based on how closely they match the meaning of the user's question  or query. Since full documents or articles are usually too large to embed directly into a vector, they are typically split into smaller chunks. These smaller chunks are then indexed in systems like Azure AI Search, making it easier to retrieve relevant information efficiently.

<img src="https://appliedaipublicdata.blob.core.windows.net/cmuqa-08-09/output/fabric_guidance_genai.png" style="width:1000px;"/>

This tutorial provides a quickstart guide to use Fabric for building RAG applications. The main steps in this tutorial are as following:

1. Set up Azure OpenAI and Azure AI Search Services
2. Load and manipulate the data from [CMU's QA dataset](https://www.cs.cmu.edu/~ark/QA-data/) of Wikipedia articles
3. Chunk the data by leveraging Spark pooling for efficient processing
4. Create embeddings using [Azure OpenAI Services](https://aka.ms/openai-embeddings)
5. Create a Vector Index using [Azure AI Search](https://aka.ms/what-is-azure-search)
6. Generate answers based on the retrieved context using [OpenAI](https://aka.ms/azure-openai-overview)

## Prerequisites

You need the following services to run this notebook.

- [Microsoft Fabric](https://aka.ms/fabric/getting-started)
- [Add a lakehouse](https://aka.ms/fabric/addlakehouse) to this notebook. You will download data from a public blob, then store the data in the lakehouse resource.
- [Azure AI Studio for OpenAI](https://aka.ms/what-is-ai-studio)
- [Azure AI Search](https://aka.ms/azure-ai-search)

## Deployment Instructions

Follow these instructions [to import a notebook into Fabric](https://learn.microsoft.com/en-us/fabric/data-engineering/how-to-use-notebook). After uploading the notebook, you will need to ensure you have the following to insert into a cell for the remainder of the code to work.

- OpenAI endpoint and keys
- Azure AI Search endpoint and keys

Make sure to use the `environment.yaml` to upload into Fabric to create, save, and publish a [Fabric environment](https://learn.microsoft.com/en-us/fabric/data-engineering/create-and-use-environment). 

Then select the newly created environment before running the notebook. The very last cell of the notebook display an ipywidget with a dialogue box for a user to write their question and a response will be given. If the user wishes to ask a new question, simply change the text in the question and press Enter. 
 
## Modified CMU Question/Answer Dataset

Considering the original dataset has different licenses for S08/S09 and S10, the modified dataset has been created of only S08/S09 rows with a reference to the ExtractedPath. For simplicity, the data is cleaned up and refined into a single structured table with the following fields.

- ArticleTitle: the name of the Wikipedia article from which questions and answers initially came.
- Question: manually generated question based on article
- Answer: manually generated answer based on question and article
- DifficultyFromQuestioner: prescribed difficulty rating for the question as given to the question-writer
- DiffuctlyFromAnswerer: Difficulty rating assigned by the individual who evaluated and answered the question, which may differ from the difficulty from DifficultyFromQuestioner
- ExtractedPath: path to original article. There may be more than one Question-Answer pair per article
- text: cleaned wikipedia article

### History 
CMU Question/Answer Dataset, Release 1.2

8/23/2013

Noah A. Smith, Michael Heilman, and Rebecca Hw

Question Generation as a Competitive Undergraduate Course Project

In Proceedings of the NSF Workshop on the Question Generation Shared Task and Evaluation Challenge, Arlington, VA, September 2008. 
Available at: http://www.cs.cmu.edu/~nasmith/papers/smith+heilman+hwa.nsf08.pdf

Original dataset acknowledgements:

This research project was supported by NSF IIS-0713265 (to Smith), an NSF Graduate Research Fellowship (to Heilman), NSF IIS-0712810 and IIS-0745914 (to Hwa), and Institute of Education Sciences, U.S. Department of Education R305B040063 (to Carnegie Mellon).

cmu-qa-08-09 (modified verison)

6/12/2024

Amir Jafari, Alexandra Savelieva, Brice Chung, Hossein Khadivi Heris, Journey McDowell

Released under same license GFDL (http://www.gnu.org/licenses/fdl.html)
All the GNU license applies to the dataset in all copies.