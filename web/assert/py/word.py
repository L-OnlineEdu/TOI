import re
import docx
import DB

doc=docx.Document(r'F:/Ttt/TOI/out/artifacts/TOI_war_exploded/assert/py/a.docx')


fullText = []
for para in doc.paragraphs:
    fullText.append(' '+para.text)
oneline="".join(fullText)
ques=oneline.split("．")
tm=[]
for ss in ques:
    tail=ss[-3:]
    ob=re.search('[0-9]',tail)
    if ob!=None:
          index=re.search(r'[0-9]',tail).start()
          tm.append(ss[0:-3+index])
    else:
          tm.append(ss)
i=0
fails=""
db=DB.openconn()
for ss in tm:

    ob = re.search('[A-D]',ss)
    if ob!=None:
        i = i + 1
        yz=ob.span()
        index=ss.find("A、")
        if index==-1:
            index=re.search("A\.?\S+?",ss)
            if index==None:
                fails+=ss+"########";
                continue;
            else:
                index=index.start()
        title=ss[0:yz[0]]
        title+=ss[yz[1]:index]
        choose=ss[index:]
        ans=ss[yz[0]:yz[1]]
        print(str(i)+"题目:"+title+"\n答案："+ans+"\n选项："+choose)
        DB.insertsql(db, title, choose, ans, 1)
DB.dbclose(db)
print("fails"+fails)

