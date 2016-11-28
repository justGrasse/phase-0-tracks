# HTTP Requests 
## Questions and Answers

1. **What are some of the key design philosophies of the Linux operating system?**

  EACH PROGRAM FILTERS THE DATA STREAM: Data is manipulated by taking std input and sending std output (STDIO).

  KEEP THINGS SMALL: Each program must be as small as possible to achieve a specific task.

  PORTABILITY ABOVE EFFICIENCY: Programs that are portable are more important than efficient.  Avoid compiling for efficiency if it becomes difficult to move those programs.

  LEVERAGE SOFTWARE: Borrow good code, and create great code to be borrowed by others. Open source means we're all in this together, take help!

2. **In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?**

  A VPS is a magical machine that is hosted by an online provider, that can be accessed remotely by customers.  

  VPS can be a cost effective way to host a website.  It allows for scalability: to start small and start to accrue resources that are needed as the server grows.  VPS also allows for greater stability relative to shared hosting, which is affected by the traffic and activities of other customers.   

3. **Why is it considered a bad idea to run programs as the root user on a Linux system?**

  Security: the root user should control all the administrative tasks in order to prevent crashes and vulnerabilities from impairing the machine.  If you're logged in as root, than ALL applications are running with root privileges, and viruses (or nasty bugs) now have access everywhere.