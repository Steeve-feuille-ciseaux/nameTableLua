-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

x=0
y=2

strJoueur =5+1
joueurs = {
	{"Mbappe",10,"ATT"},-- ne pas toucher
	{"Mbappe",10,"ATT"},
	{"Griezmann",7,"MLO"},
	{"Dembele",11,"ATT"},
	{"L.Hernendez",4,"DEF"},
	{"L.Hernendez",4,"DEF"}-- ne pas toucher
}	
	
function cadreData(Theme,Mode,pX,pY,pW,pAx,tX,Txt,strTxt)
 if Mode >= 4 then
 	Mode = 3
  x= 3
 elseif Mode <= -1 then 
 	Mode = 0
  x= 0
 end
 
 if y >= strTxt then
 	y = 5
 elseif y <= 1 then 
 	y = 2
 end
 
 if Theme==Mode then 
		if btnp(0) then
		 Up=pY-10
			y=y+1 
		else
		 Up=pY-8
		end
		
		if btnp(1) then
		 Down=pY+27
			y=y-1 
		else
		 Down=pY+25
		end
	spr(35,pAx,Up)
	spr(36,pAx,Down)
	end
	tY=pY+10
	rectb(pX,pY,pW,25,12)
	print(Txt,tX,tY,12)
end

function TIC()

	if btnp(2) then x=x-1 end
	if btnp(3) then x=x+1 end

	cls(0)
	
	map()
	-- debug
	print(x,10,10,12)
	print(y,10,20,12)
	
	cadreData(1,x,20,5,40,35,35,joueurs[y][2],strJoueur)
	cadreData(2,x,90,5,90,130,105,joueurs[y][1],strJoueur)
	cadreData(1,x,200,5,40,35,212,joueurs[y][3],strJoueur)		
	
end
