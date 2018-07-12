#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

using namespace std;

int main () {
        char file_name [100];
        string line;
        int lcount = 0;
        int scount = 0;
        std::cin >> file_name;
        ifstream myfile (file_name);
        if (myfile.is_open()) {
                while ( getline (myfile,line) )
                {
                        string temp = "";
                        if(line.length() > 3)
                                temp = line.substr (3,2); 
                        if(!strcmp(temp.c_str(), "lw"))
                                lcount ++ ; 
                        if (!strcmp(temp.c_str(), "sw"))
                                scount ++ ; 	
                }
                myfile.close();
        }
        else cout << "Unable to open file"; 

        printf("The number of loads %d.\n", lcount);
        printf("The number of stores was %d.\n", scount);
        return 0;
}
