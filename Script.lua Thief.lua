--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


entered = false;
hasSpell = false;
castSpellLib = false;

function story(aName)
	if(aName == "start") then
		playMusic("background.wav")
		setBackground("home.jfif")
		createTextfield("You need money for a new Hellcat.\nEscape without getting caught.")
		createButton("exit", "I'm too scared")
		createButton("entrance", "Let's do this!")
	end
	if(aName == "entrance") then
		if(entered == false) then
			playSound("door.wav")
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		setBackground("corridor2.jpg");
		createTextfield("You've entered the empty corridor. Where do you want to go?.")
		createButton("leftHallway", "Go in the room on your left.");
		createButton("rightHallway", "Go in the room behind you.")
		createButton("upStairs", "Go down the stairs.")
	end
	if(aName == "leftHallway") then
		playSound("footstep.wav")
		CLS();
		setBackground("window.jpg")
		createTextfield("You enter the room")
		createButton("entrance", "Go back to the corridor.");
		if(hasSpell == false) then
			createButton("searchBooks", "Take a closer look at the desk")
		end
	end
	if(aName == "searchBooks") then
		CLS();
		playSound("pageFlip.wav")
		createTextfield("It seems you found a key for a Safe.")
		createButton("entrance", "You go back to the main hall")
		hasSpell = true;
	end
	if(aName == "rightHallway") then
		CLS()
		playSound("footstep.wav")
		setBackground("homeowner.jpg")
		if(castSpellLib == true) then
			createTextfield("You slowly open the door and see a desk. You also see the Safe next to the door.")
		else
			createTextfield("You slowly open the door and see a desk")
		end
		
		createButton("entrance", "Slowly close the bedroom door.")
		if(hasSpell == true and castSpellLib == false) then
			createButton("rightHallwaySpell", "Open the Safe.")
		end
	end
	if(aName == "rightHallwaySpell") then
		CLS()
		createTextfield("You carefully open the Safe and grab the money.")
		castSpellLib = true;
		createButton("entrance", "Now that you grabbed the money you leave and carefully close the bedroom door.")
	end
	if(aName == "upStairs") then
	CLS()
	playSound("footstep.wav")
		if(hasSpell == true and castSpellLib == true) then
			setBackground("thiefmoney.jpg")
			createTextfield("Congrats. You succesfully escaped with the money!")
			createButton("exit", "You go to the Dodge dealership and buy a Hellcat with cash.")
		else
			setBackground("police.jpg")
			createTextfield("Hands up where i can see them! You're under arrest!")
			createButton("exit", "The homeowner already saw you and called the cops on you. Now you're going to jail.")
		end
	end
	if(aName == "exit") then
		exitGame();
	end
end

