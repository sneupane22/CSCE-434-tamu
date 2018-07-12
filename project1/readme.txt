This is obviously my attempt to implement the lexical scanner.

I want to mention few comments:

(0) This is my second submission, not my first. The Prof said it is not late to submit
    another code. However, if this is considered late, please take the first submission
    as my actual submission. This is just a fix for certain problems.

(1) At the beginning, I implemented comment which was something like:
        {comment} "/*"([^"*/"])"*/"
    but it was not correct. I searched online and found a helpful solution using
    conditional statements in flex. I pretty much used the following code:
        %x C_COMMENT
        "/*"            { BEGIN(C_COMMENT); }
        <C_COMMENT>"*/" { BEGIN(INITIAL); }
        <C_COMMENT>.    { }
    http://stackoverflow.com/questions/2130097/difficulty-getting-c-style-comments-in-flex-lex
    Those are literally the only 4 lines I found online that I used. Of course
    I modified them to fit my purpose. I do not know of any other implementation
    beside using conditionals, and this seems to be the only way. Thus, I had to
    address that. This is what I put inside my dpp.l
        %x COMMENT
        ...
        "/*"          { line = "  "; original_line = "/*"; printf("  ");BEGIN(COMMENT); }
        <COMMENT>"*/" { line += "  "; cout << line; BEGIN(INITIAL); }
        <COMMENT>.    { line += " "; original_line += string(yytext); }
        <COMMENT>\n   { line += "\n"; original_line += "\n"; }
        <COMMENT><<EOF>> { cout << original_line; BEGIN(INITIAL);}
    I hope this is not considered cheating.
    
(2) You will notice output/ folder. It contains all of my dcc output. I noticed
    it is easier to make the testing process automatic. so I created a file
    called compile.sh which runs dcc on all .frag and .decaf files in the output
    directory and then runs diff to compare it with the output in samples/
    folder. It would be great to have such capabilities out of the box.

(3) I like the fact that the output is tested against diff functionality. I
    think that is a good idea always because it removes ambiguity. However, the
    only problem is the the description is not clear on the format of the
    output and errors, as well as what is considered to be an error. This makes
    things difficult on us to figure things out.

(4) Thank you very much for putting many test cases for us. This is extremely
    helpful. Thank you very much for sending demo/ folder as well. I really
    appreciate that, and I know many students do that as well.

Sorry if my comments are long, but I thought they are necessary.
