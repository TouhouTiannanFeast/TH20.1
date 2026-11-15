-- New Stage5 document; all other story scenes and combat sources stay intact.
local C,D,S=SixStageCampaign,SixStageDialogue3,SixStageStory46
local data=dofile('mod/SixStageCampaign/stage5-dialogue/data.lua')
for key,pages in pairs(data)do S.data.scenes[key]=pages;SixStageScreenplay.data.scenes[key]=pages end
for _,n in ipairs({1,2,3,6,9,10})do
 local name='six.horou.doc.'..n;local file='mod/SixStageCampaign/stage5-dialogue/horou'..n..'.png'
 LoadTexture(name,file);LoadImage(name,name,0,0,1024,1024)
 local cx,cy,scale=470,996,360/751
 if n==1 then cx,cy,scale=528.5,889,360/836 end
 SetImageCenter(name,cx,cy)
 D.data.art['horou'..n]={scale=scale,layers={{image=name}}}
end
-- s5mid uses the shared normal dialogue path, like the other Stage5 scenes.
