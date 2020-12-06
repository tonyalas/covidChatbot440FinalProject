/*      This is the final project code for COMP-4400 
        Created by: Tony Alas, 104754179
        Submitted on: December XX, 2020
*/

/* This will print the welcome message from the "chatbot" and set the yes-response counter to 0 */
chat:- 
        print_welcome,
        nb_setval(counter, 0).

/* A function that will print a simple greeting message coming from the "Covid Bot". */
print_welcome:- 
        W = ['Welcome to the COVID-19 Chatbot.'],
        print_prompt(me),
        write_list(W),
        Q = ['What is your name? [Respond with: name(yourNameInLowerCase).]\n***** NOTE: the period at the end of your response is necessary. *****'],
        print_prompt(me),
        write_list(Q),
        flush_output. 

/* This will allow the program to easily output that the bot is speaking. */
print_prompt(me):-
        my_icon(X), write(X), write(': '), flush_output.

my_icon('Covid Bot').

/* 
        takes the user's name and asks the user for their mood/feeling
*/
name(X):- 
        print_prompt(me),
        W = ['Good day', X,', how are you? [Respond with: iam(yourFeeling).]'],
        write_list(W),
        flush_output.

/*
        a list of possible responses that have a positive connotation
*/
goodResponse(good).
goodResponse(great).
goodResponse(okay).

/*
        takes the user's mood and asks them if they have a fever.
        based on how they answer, the reponse will change slightly.
*/
iam(X):- 
        print_prompt(me),
        goodResponse(A),
        A=@=X,
        W = ['I am glad to hear you are feeling', X, ', let us now get started.\n\nCovid Bot: I am going to ask you a few questions about Covid-19 and will then determine if you should contact your local health unit and/or doctor.\n\nCovid Bot: Firstly, do you have a fever? [Respond with: fever(yes/no).]\n***** Please press \'.\' (period) to respond to the question. *****'],
        write_list(W);
        Z = ['Oh no, that is not good to hear.\n'],
        write_list(Z),
        Q = ['I am going to ask you a few questions about Covid-19 and will then determine if you should contact your local health unit and/or doctor.\n'],
        print_prompt(me),
        write_list(Q),
        L = ['Firstly, do you have a fever? [Respond with: fever(yes/no).]'],
        print_prompt(me),
        write_list(L),
        flush_output.

/*
~~~~~~~~~~~~~ THE FOLLOWING PROCEDURES BELOW HAVE A SIMILAR DESCRIPTION. ~~~~~~~~~~~~
        The procedures below will take in a previous response and then output a slightly different response based on if the user
        said yes or no, and then will ask them the next question.
        If the user answers yes, the counter variable will increase (by calling the add procedure).
*/
fever(X):- 
        (X = 'yes', print_prompt(me), write("Okay, so you have a fever.\n\nDo you have a dry cough? [Respond with: drycough(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("Okay, so you do not have a fever. Noted. Next question.\n\nDo you have a dry cough? [Respond with: drycough(yes/no).]")).

drycough(X):-
        (X = 'yes', print_prompt(me), write("So you have a dry cough, another common symptom.\n\nAre you feeling excessively tired? [Respond with: tired(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("Okay, so you do not have a dry cough. Good to hear. Next question.\n\nAre you feeling excessively tired? [Respond with: tired(yes/no).]")).

tired(X):-
        (X = 'yes', print_prompt(me), write("So you are feeling tired. Nothing too unusual but it can be a common symptom.\n\nNow for the more serious symptoms.\n\nDo you have difficulty breathing or have a shortness of breath? [Respond with: breath(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("Okay, so you do not feel overly tired. That's good. Next question.\n\nNow for the more serious symptoms. Do you have difficulty breathing or have a shortness of breath? [Respond with: breath(yes/no).]")).

breath(X):-
        (X = 'yes', print_prompt(me), write("Okay, let me write that down. Difficulty breathing is often one of the first major symptons you will feel.\n\nNow, do you feel any intense chest pain or a sense of pressure on your chest? [Respond with: chestpain(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), addtwo; 
        (X \= 'yes', print_prompt(me), write("That is very good to hear. Difficulty breathing is one of the first noticeable major symptoms so you would have felt it by now.\n\nNow, do you feel any intense chest pain or a sense of pressure on your chest? [Respond with: chestpain(yes/no).]")).

chestpain(X):-
        (X = 'yes', print_prompt(me), write("I'll take note of that. I hope it is not too bad.\n\nHave you found that you have a loss of speech or find it difficult to move? [Respond with: speech(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), addtwo; 
        (X \= 'yes', print_prompt(me), write("Oh good! That is good to hear.\n\nHave you found that you have a loss of speech or find it difficult to move? [Respond with: speech(yes/no).]")).

speech(X):-
        (X = 'yes', print_prompt(me), write("Right. Now onto some of the less common and minor symptoms that will help me determine your next course of action.\n\nDo you have a sore throat that has persisted longer than normal? [Respond with: sorethroat(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), addtwo; 
        (X \= 'yes', print_prompt(me), write("Right. Now onto some of the less common and minor symptoms that will help me determine your next course of action.\n\nDo you have a sore throat that has persisted longer than normal? [Respond with: sorethroat(yes/no).]")).

sorethroat(X):-
        (X = 'yes', print_prompt(me), write("A normal symptom that can occur in multiple forms of sickness, but I will take that into consideration.\n\nHave you felt aches and pains that seem unprovoked? [Respond with: aches(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("Good, good.\n\nHave you felt aches and pains that seem unprovoked? [Respond with: aches(yes/no).]")).

aches(X):-
        (X = 'yes', print_prompt(me), write("Random aches and pains that occur despite you doing nothing to provoke them is unusual. Just two more questions.\n\nHave you gotten any rashes on your skin? [Respond with: rash(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("That is a good sign. Just two more questions.\n\nHave you gotten any rashes on your skin? [Respond with: rash(yes/no).]")).

rash(X):-
        (X = 'yes', print_prompt(me), write("Another possible symptom of Covid-19, less common but still necessary to take into consideration. Okay, final question, thank you for being patient.\n\nHave you noticed a distinct lack of taste or smell? Perhaps food does not taste like anything specific and maybe even tastes flavourless? [Respond with: taste(yes/no).]\n***** Please press '.' (period) to respond to the question. *****")), add; 
        (X \= 'yes', print_prompt(me), write("Great! Okay, final question, thank you for being patient.\n\nHave you noticed a distinct lack of taste or smell? Perhaps food does not taste like anything specific and maybe even tastes flavourless? [Respond with: taste(yes/no).]")).

taste(X):-
        (X = 'yes', print_prompt(me), write("This is certainly a terrible symptom to be affected by.\n\nBefore finalizing your total score and giving my recommendation, I would like to remind you that I am only a chatbot and may make a mistake in judgement so please only take my recommendation as a minor assistance and do not hesitate on going to visit a doctor if you start to feel worse.\n\nI will now show you your overall score and give my recommendations.\n\n")), add, counterValue(); 
        (X \= 'yes', print_prompt(me), write("What relief! A lack of taste would be very terrible.\n\nBefore finalizing your total score and giving my recommendation, I would like to remind you that I am only a chatbot and may make a mistake in judgement so please only take my recommendation as a minor assistance and do not hesitate on going to visit a doctor if you start to feel worse.\n\nI will now show you your overall score and give my recommendations.\n\n")), counterValue().


/*
        this will get the counter variable, increase it by 1 and then store it again.
*/
add:- nb_getval(counter, C), CNew is C + 1, nb_setval(counter, CNew).

/*
        this will get the counter variable, increase it by 2 and then store it again.
        This is primarily if the user responds with yes to one of the serious symptoms so it can adjust for their score.
*/
addtwo:- nb_getval(counter, C), CNew is C + 2, nb_setval(counter, CNew).

/*
        This will get the counter variable, output a message and then call the procedure to check the score.
*/
counterValue():-
        nb_getval(counter, CounterValue),
        write("Your total score is: "), writeln(CounterValue),
        checkCounter(CounterValue).


/*
        If the user's score is below 4 (exclusive), it will go to the procedure that tells the user that they should be safe for now,
        if it is above 4 (inclusive) then it will go to an intermediate procedure that will do another comparison.
*/
checkCounter(X):-
        (X < 4, noReport ; intermediateFunc(X)).  

/*
        if the user's score is not too high, then output this message.
*/
noReport:-
        print_prompt(me),  
        write("Based on your responses and overall result number, you do not need to worry about contacting anyone. Congrats! Again, I am not a certified or an official source to determine your overall health and safety but my recommendation would be that you are safe and do not need to refer to a medical professional.\n\nIf you find that your condition worsens, then absolutely refer to a medical professional and report to your local health unit.\n\nThank you for using this COVID-19 chatbot service, I hope it was useful. I am glad to hear that you do not need to seek any medical attention for now. Remember to continue to wear your mask, wash your hands frequently, avoid going out in large groups and keep a safe distance from others in public! Together we can beat COVID-19 and finally rid of this eventually! Have a great day. :)\n\nIf you would like to read the information about Covid-19 and recieve the additional resources, please type: covidInfo. and hit enter.\nIf you wish to take the questions again please type: takeAgain. and hit enter.\n***** Please press '.' (period) to enter your response. *****").

/*
        If the user's score is below 7 (exclusive), it will go to the procedure that tells the user that they are okay for now but should be wary,
        if it is above 7 (inclusive) then it will tell them to report to a doctor, etc.
*/
intermediateFunc(X):-
        (X < 7, mediumReport ; yesReport).

/*
        Warn the user that they should keep an eye on themselves.
*/
mediumReport:-
        print_prompt(me), 
        write("Based on your responses and overall result number, you have scored an average/medium result. Therefore I would recommend that you are technically safe for now but to definitely keep a close watch on your symptoms to see if they worsen or you start to develop more symptoms.\n\nIf you would like to read the information about Covid-19 and recieve the additional resources, please type: covidInfo. and hit enter.\nIf you wish to take the questions again please type: takeAgain. and hit enter.\n***** Please press '.' (period) to enter your response. *****").
/*
        tell the user to report to a doctor and their local health unit.
*/
yesReport:- 
        print_prompt(me), 
        write("Based on your responses and overall result number, you have recieved a CRITICAL risk level. You should contact your family doctor and local health unit to take action immediately. Your score indicates that you are at high risk of having Covid-19 and I would recommend that you do not go out in public to prevent potential spreading, as well as let family members and anyone you have come in contact know that they should be careful as well."), covidInfo.

covidInfo:-
        print_prompt(me),
        write("I am now going to give you a list of resources regarding Covid-19 which should be of help to you.\n\n
                PREVENTATIVE MEASURES:\n-Clean your hands often. This can be with soap and water or with alcohol-based sanitizer.
                \n-Maintain a safe distance from people in public, especially those who are sneezing or coughing.
                \n-Wear a mask both when physical distancing is and is not possible.
                \n-Try to avoid touching your eyes and nose.
                \n-Stay home if you feel ill.
                \n-Please seek medical attention if you feel unwell.
                \nHELPFUL LINKS: (copy and paste into your browser)
                \nCanadian Covid-19 Resource: https://covid19resources.ca
                \nWHO Covid-19 Website: https://www.who.int/emergencies/diseases/novel-coronavirus-2019
                \nMental Health Resource: https://www.mentalhealthcommission.ca/English/mhcc-covid-19-resources
                \nCanadian Covid-19 Resource: https://www.canada.ca/en/public-health/services/diseases/coronavirus-disease-covid-19.html
                \nOntario Stages and Their Meanings: https://www.ontario.ca/page/covid-19-response-framework-keeping-ontario-safe-and-open
                \nI hope that this service chatbot has been able to help you and I hope that you keep safe. Have a good day.\nIf you wish to take the questions again please type: takeAgain. and hit enter.").

/*
        let the user to take the questions again by calling chat which will restart from the beginning and reset the counter value.
*/
takeAgain:-
        chat.

/* This will simply write the given input to the standard output (which is just the console in this case) */
write_list([]):- nl.
write_list([H|T]):- write(H), write(' '), write_list(T).


/* This will autorun the first function so that the bot will print a welcome message as soon as the program runs. */
?-chat.