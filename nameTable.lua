-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

x=4 -- variable mode
y=2
i=1
j=1
z1=150 -- deplacement terrain test
z2=50 -- variable move terrain te


P1={
 {"Mbappe",10,"ATT",150,50},
	{"Giroud",9,"ATT",140,100},
	{"Dembele",11,"ATT",130,100},
	{"Griezmann",7,"MLO",120,100},
	{"Pogba",6,"MLO",110,100},
	{"Kante",8,"MLD",100,100},
	{"Pavard",3,"DEF",90,100},
	{"Varanne",2,"DEF",80,100},
	{"Umtiti",5,"DEF",70,100},
	{"L.Hernendez",4,"DEF",60,100},
	{"Loris",1,"GK",50,100}
}

strJoueur =6+1 -- taille du tableau 1/2
joueurs = {
	{"Mbappe",10,"ATT"},-- ne pas toucher
	{"Mbappe",10,"ATT"},
	{"Griezmann",7,"MLO"},
	{"Giroud",9,"ATT"},
	{"Dembele",11,"ATT"},
	{"L.Hernendez",4,"DEF"},
	{"L.Hernendez",4,"DEF"}-- ne pas toucher
}	
	
function cadreData(Theme,Mode,pX,pY,pW,pAx,tX,Txt,strTxt)
 if Mode>=9 then
 	Mode=8
  x=8
 elseif Mode <= -1 then 
 	Mode = 0
  x= 0
 end
 
 if y >= strTxt then
 	y = 6 -- taille du tableau 2/2
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

	-- commande 
	  -- select Mode
	if keyp(23) then
	  x=x-1
	elseif keyp(24) then
	  x=x+1
	end
	
   -- select joueur
 if x==1 then
		if btnp(2) then x=x-1 end
		if btnp(3) then x=x+1 end
	end
	
	  -- P1 deplacement joueur
	if x==3 then
		if btn(0) then P1[i][5]=P1[i][5]-0.25 end
		if btn(1) then P1[i][5]=P1[i][5]+0.25 end
		if btn(2) then P1[i][4]=P1[i][4]-0.25 end
		if btn(3) then P1[i][4]=P1[i][4]+0.25 end
	end
	
   -- P1 change joueur
 if x==4 then
		if btnp(2) then i=i-1 end
		if btnp(3) then i=i+1 end
		 if i>=12 then
		 	i=11
		 elseif i<=0 then 
		  i=1
		 end
	end
	
   -- P2 change joueur
 if x==5 then
		if btnp(2) then j=j-1 end
		if btnp(3) then j=j+1 end
	end
	
	cls(0)
	
	map()
	-- debug
	print(x,10,10,12) -- Mode Debug
	print(y,10,20,12) -- Index Player
	print(i,10,50,9) -- Index Player 1
	print(j,220,50,2) -- Index Player 2
	
	-- joueur sur le terrain
	 -- Equipe P1
	for k=1, #P1 do
	 print(P1[k][2],P1[k][4],P1[k][5],9)
	end
  -- Controle P1
 if i==P1[i][2] then 
  circb(P1[i][4],P1[i][5],5,12)
	end
  circb(P1[1][4],P1[1][5],5,12)
	
	cadreData(-2,x,20,5,40,35,35,joueurs[y][2],strJoueur)
	cadreData(1,x,90,5,90,130,105,joueurs[y][1],strJoueur)
	cadreData(-2,x,200,5,40,35,212,joueurs[y][3],strJoueur)		
	
end
