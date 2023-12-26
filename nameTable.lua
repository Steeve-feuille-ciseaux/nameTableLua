-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

x=2 -- variable mode
y=2
i=1
j=1
z1=150 -- deplacement terrain test
z2=50 -- variable move terrain te

P1={
	{"Lloris",1,"GK",40,63},
	{"Pavard",2,"DEF",65,30},
	{"Varane",4,"DEF",57,52.75},
	{"Umtiti",5,"DEF",57.25,72},
	{"L.Hernendez",21,"DEF",65.5,90},
	{"Pogba",6,"MLO",85.75,43.75},
	{"Kante",13,"MLD",75.75,60.25},
	{"Tolisso",12,"MLO",84.25,77},
	{"Griezmann",7,"ATT",100,33},
 {"Mbappe",10,"ATT",104,62.5},
	{"Dembele",11,"ATT",100,91.25}
}

strJoueur =6+1 -- taille du tableau 1/2
P2 = {
	{"Joueur1",1,"GK",190,63},
	{"Joueur2",2,"DEF",160,30},
	{"Joueur3",3,"DEF",170,52.75},
	{"Joueur4",4,"DEF",170,72},
	{"Joueur5",5,"DEF",160,90},
	{"Joueur6",6,"MLO",145,43.75},
	{"Joueur7",13,"MLD",150,60.25},
	{"Joueur8",10,"MLO",145,77},
	{"Joueur9",7,"ATT",128,33},
 {"Joueur10",9,"ATT",125,62.5},
	{"Joueur11",11,"ATT",123,91.25}
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
	rectb(pX,pY,pW,22,12)
	print(Txt,tX,tY,12)
end

function TIC()

	-- commande 
	  -- select Mode
	if keyp(28) then
	  x=1
	elseif keyp(29) then
	  x=2
	elseif keyp(30) then
	  x=3
	end
	
   -- select joueur
 if x==1 then
		if btnp(2) then x=x-1 end
		if btnp(3) then x=x+1 end
	end
	
	  -- P1 deplacement joueur
	if x==2 then
   -- P1 change joueur
		if keyp(23) then i=i-1 end
		if keyp(24) then i=i+1 end
	 if i>=12 then
	 	i=11
	 elseif i<=0 then 
	  i=1
	 end
		if btn(0) then P1[i][5]=P1[i][5]-0.25 end
		if btn(1) then P1[i][5]=P1[i][5]+0.25 end
		if btn(2) then P1[i][4]=P1[i][4]-0.25 end
		if btn(3) then P1[i][4]=P1[i][4]+0.25 end
	end
	
   -- P2 change joueur
 if x==3 then
   -- P2 change joueur
		if keyp(23) then j=j-1 end
		if keyp(24) then j=j+1 end
	 if j>=12 then
	 	j=11
	 elseif j<=0 then 
	  j=1
	 end
		if btn(0) then P2[j][5]=P2[j][5]-0.25 end
		if btn(1) then P2[j][5]=P2[j][5]+0.25 end
		if btn(2) then P2[j][4]=P2[j][4]-0.25 end
		if btn(3) then P2[j][4]=P2[j][4]+0.25 end
	end
	
	cls(0)
	
	map()
	-- debug
	print(x,10,10,12) -- Mode Debug
	print(y,10,20,12) -- Index Player
	print(i,10,50,9) -- Index Player 1
	print("X : "..P1[i][4],0,60,9) -- Px index P1
	print("Y : "..P1[i][5],0,70,9) -- Px index P1
	print(j,220,50,2) -- Index Player 2
	print("X : "..P2[j][4],200,60,2) -- Px index P2
	print("Y : "..P2[j][5],200,70,2) -- Px index P2
	
	-- joueur sur le terrain
	 -- Equipe P1
	for k=1, #P1 do
	 print(P1[k][2],P1[k][4],P1[k][5],9)
	end
  -- Controle P1
 circb(P1[i][4]+2,P1[i][5]+2,5,12)
	
	cadreData(-2,x,20,0,40,35,35,P1[i][2],strJoueur)
	cadreData(1,x,90,0,90,130,105,P1[i][1],strJoueur)
	cadreData(-2,x,200,0,40,35,212,P1[i][3],strJoueur)	
	
	 -- Equipe P2
	for k=1, #P2 do
	 print(P2[k][2],P2[k][4],P2[k][5],2)
	end
  -- Controle P2
 circb(P2[j][4]+2,P2[j][5]+2,5,12)
	
	cadreData(-2,x,20,110,40,35,35,P2[j][2],strJoueur)
	cadreData(1,x,90,110,90,130,105,P2[j][1],strJoueur)
	cadreData(-2,x,200,110,40,35,212,P2[j][3],strJoueur)		
		
end
