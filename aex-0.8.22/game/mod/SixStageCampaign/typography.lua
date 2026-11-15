local P={};SixStageTypography=P
local dir='mod/SixStageCampaign/presentation/'
for name,file in pairs({regular='SourceHanSerifCN-Regular.otf',heavy='SourceHanSerifCN-Heavy.otf',latin='times.ttf'})do
 LoadTTF('six.serif.'..name,dir..file,36)
 LoadTTF('six.notice.'..name,dir..file,48)
end
-- ASCII letters/digits use Times; CJK body/titles use Regular, names Heavy.
function P.draw(text,x,y,alpha,role,large)
 local prefix=large and'six.notice.'or'six.serif.'
 for ch in tostring(text or''):gmatch('[%z\1-\127\194-\244][\128-\191]*')do
  local latin=ch:match('^[A-Za-z0-9]$')~=nil
  local face=latin and'latin'or(role=='name'and'heavy'or'regular')
  RenderTTF(prefix..face,ch,x+1,x+1,y-1,y-1,Color(alpha,0,0,0),'noclip')
  RenderTTF(prefix..face,ch,x,x,y,y,Color(alpha,255,255,255),'noclip')
  x=x+(#ch==1 and(large and 12 or 9)or(large and 24 or 18))
 end
 return x
end

-- Render-only reflow: retain the recorded dialogue pages and advance times.
function P.dialogueRows(rows,width)
 local out,line,x={},'',0
 for ch in table.concat(rows or{},''):gmatch('[%z\1-\127\194-\244][\128-\191]*')do
  local step=#ch==1 and 9 or 18
  if x+step>width and line~=''then out[#out+1]=line;line='';x=0 end
  line=line..ch;x=x+step
 end
 if line~=''then out[#out+1]=line end
 return out
end
