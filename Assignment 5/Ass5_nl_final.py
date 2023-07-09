import nltk
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from pyswip import Prolog

print('System: Please Enter your name: ')
name = input('You: ')
print()
print('System: Hello  {} !!'.format(name))
print('System: First year student? If yes then this is the right place for you.')
print('If not, Nothing to worry! Still I can Help.')
print('This is an advisory system which will suggest you the electives on your interest.')
print()
print('System: What is the current CGPA going on (if not then enter Btech CGPA)?')
cg = input('You: ')
print()

print('System: Amoung the list of subjects, you incline towards which subject?')
print('1) Mathematics.')
print('2) Database Management System.')
print('3) Computer Networks.')
#print('4) Opearting Syatem [OS]')
print('You:  ')
subj = input()

#tokeninzing + stemming the subjects
ps = PorterStemmer()
subj_input = word_tokenize(subj)
subj_input_stem = []
for i in subj_input:
    subj_input_stem.append(ps.stem(i))

# checking for maths
if ('math' in subj_input_stem) or ('mathemat' in subj_input_stem) or ('maths' in subj_input_stem):
        subj = 'maths'

# checking for dbms
if 'data' in subj_input_stem or 'manag' in subj_input_stem or 'syst' in subj_input_stem or 'database' in subj_input_stem:
    subj = 'dbms'

# checking for cn
if ('computer' in subj_input_stem) or ('network' in subj_input_stem) or ('cn' in subj_input_stem):
    subj = 'cn'

print("\nSystem: Sure, great choice. You will surely do well in {}.\nLet's try to find the electives which you can take.".format(subj.upper()))
print('System: Rate yourself from 0 to 4.')
print('0 => no knowledge/interest')
print('1 => low knowledge/interest')
print('2 => medium knowledge/interest')
print('3 => high knowledge/interest')
print('4 => very high knowledge/interest')
print()

#mapping of interst to numbers.
def mapping_to_number(x):
    x = word_tokenize(x)  # tokenizing
    ps = PorterStemmer()  # for stemming
    l = []                # list to have words after stemming
    for i in x:
        l.append(ps.stem(i))
    if 'no' in l:
        return 0
    elif 'low' in l:
        return 1
    elif 'medium' in l or 'med' in l or 'mid' in l:
        return 2
    elif 'high' in l:
        return 3
    elif 'very' in l or 'high' in l:
        return 4   

#opening a file and then adding facts into file.
file = open("temporary.pl", 'w')

if subj == 'maths':
    print('Please answer the following question asked below:-')
    x = input("1. Interested in constructing statistical models based on Baye's Theorem?")
    x = mapping_to_number(x)
    file.write("interest('Bayesian Machine Learning (BML)',{}).\n".format(x))
    x = input("2. Interest in Statistics on the scale of ?")
    x = mapping_to_number(x)
    file.write("interest('Statistical Machine Learning (CSE542)',{}).\n".format(x))
    x = input("3. Interest in Probablity on the scale of?")
    x = mapping_to_number(x)
    file.write("interest('Probability and Random Processes (ECE501)',{}).\n".format(x))
    x = input("4. Aspiring to work on large datasets?")
    x = mapping_to_number(x)
    file.write("interest('Data Mining (CSE506)',{}).\n".format(x))
    file.close()

if subj == 'dbms':
    print('Please answer the following question asked below:-')
    x = input("1. Designing and developing databases?")
    x = mapping_to_number(x)
    file.write("interest('Database System Implementation (CES507)',{}).\n".format(x))
    x = input("2. Retrieving data from a database management system?")
    x = mapping_to_number(x)
    file.write("interest('Database Methods in Information Retrieval',{}).\n".format(x))
    x = input("3. Compiling data from multiple sources into a single data repository.?")
    x = mapping_to_number(x)
    file.write("interest('Information Integration and Application (CSE656)',{}).\n".format(x))
    file.close()

if subj == 'cn':
    print('Please answer the following question asked below:-')
    x = input("1. Interest in learning basic security concepts?")
    x = mapping_to_number(x)
    file.write("interest('Foundations to Computer Security (CSE545)',{}).\n".format(x))
    x = input("2. Retrieving data from a database management system?")
    x = mapping_to_number(x)
    file.write("interest('Ethical Hacking (CSE798A)',{}).\n".format(x))
    x = input("3. Compiling data from multiple sources into a single data repository.?")
    x = mapping_to_number(x)
    file.write("interest('Network Anonymity and Privacy (CSE749)',{}).\n".format(x))
    file.close()

print()
print("List of Elective that you can take: ")
# consulting file
swipl = Prolog()
swipl.consult("choices.pl")
print()
print("In list format:")
elective_list = list(swipl.query("eligible(X)"))
print(elective_list)
print()
print('Thank you.!!')