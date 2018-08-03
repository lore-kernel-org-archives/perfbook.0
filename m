Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B5LJUFIU0h08WiX4k3wgRLDrGwmF5ICJAsDzaLKPFnk=;
 b=j2sv+oSWxCY7sGEVH0kavU/L22+Z3nKcJgR22fwMkKY52APfI0//EulnpghMi84KJk
 P8Tvz/orwa4haiWBl1dl69yWNMs9BDvb2jQIywr0lB+woZItiM5W12tYNvh2dDgZ0mpe
 /8MIGpdHMMsZYjYAKghD2O8eb8tIYWWjGWN74I7nODd/gL63Hs2l9is1mMoJMPTAX4WM
 Vg9sF6stNrWpT5hlblfZGzrocmNx1lF4c1nWw3HIocfeECarmmxKThefjIY5O6BshCOp
 dQNh84etryfUX8ppsYG9g+/rUDdR/D1beBUxCYVLS39L0cnwhnXaSVtfoofmEaK4bxvJ
 3qWw==
Subject: Re: [GIT PULL v3] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <18fcce90-11d6-4ab1-c6fc-73791a305091@gmail.com>
 <20180803143557.GA24813@linux.vnet.ibm.com>
 <1c8fb4a3-dd43-f6e9-3bf9-b1acf078f6e6@gmail.com>
 <20180803164511.GB24813@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <78672371-e921-302a-500e-d8e8ca2378f5@gmail.com>
Date: Sat, 4 Aug 2018 08:12:09 +0900
MIME-Version: 1.0
In-Reply-To: <20180803164511.GB24813@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/08/03 09:45:11 -0700, Paul E. McKenney wrote:
> On Sat, Aug 04, 2018 at 12:49:34AM +0900, Akira Yokosawa wrote:
>> On 2018/08/03 07:35:57 -0700, Paul E. McKenney wrote:
>>> On Fri, Aug 03, 2018 at 07:34:51AM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> This is v3 of the trial of fancyvrb scheme.
>>>>
>>>> Changes in v2 -> v3
>>>>
>>>>     o Define "linelabel" and "lineref" environments and use them in the early part of
>>>>       toolsoftrade.
>>>>     o Define "VerbatimU" env for short snippet with no line count and use it for
>>>>       a couple of snippet in toolsoftrade.
>>>>     o Rename "VerbatimM" to "VerbatimN".
>>>>     o Remove "[EXP]" in commit log titles.
>>>>
>>>>           Thanks, Akira
>>>>
>>>> ---
>>>> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
>>>>
>>>>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180802a
>>>>
>>>> for you to fetch changes up to 6bf7a51b7b9dadf54a0b1edc8959fafed0fcf671:
>>>>
>>>>   Add 'linelabel' and 'lineref' environment (2018-08-03 07:21:49 +0900)
>>>>
>>>> ----------------------------------------------------------------
>>>> Akira Yokosawa (9):
>>>>       toolsoftrade: Add labels in code samples as comments
>>>>       Add script to extract code snippet from code sample
>>>>       toolsoftrade: Reference line in code snippets by label
>>>>       Update hyphen2endash
>>>>       Add *.fcv to .gitignore
>>>>       Automate sub makefile update
>>>>       Specify lmtt font for VerbatimM env
>>>>       toolsoftrade: Use \lnlbl in inline code snippet
>>>>       Add 'linelabel' and 'lineref' environment
>>>>
>>>>  .gitignore                              |   2 +
>>>>  CodeSamples/api-pthreads/api-pthreads.h |  18 +--
>>>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
>>>>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
>>>>  Makefile                                |  14 ++-
>>>>  perfbook.tex                            |  21 ++++
>>>>  toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
>>>>  utilities/fcvextract.pl                 | 166 +++++++++++++++++++++++++
>>>>  utilities/gen_snippet_mk.pl             |  55 +++++++++
>>>>  utilities/hyphen2endash.sh              |   3 +
>>>>  10 files changed, 351 insertions(+), 158 deletions(-)
>>>>  create mode 100755 utilities/fcvextract.pl
>>>>  create mode 100755 utilities/gen_snippet_mk.pl
>>>
>>> Looks nice!
>>>
>>> However, I tried updating a label in CodeSamples/toolsoftrade/forkjoinvar.c
>>> like this (and yes, this is a nonsensical change just for testing):
>>>
>>> ------------------------------------------------------------------------
>>>
>>> diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
>>> index 1580478fe2f9..642451d9e880 100644
>>> --- a/CodeSamples/toolsoftrade/forkjoinvar.c
>>> +++ b/CodeSamples/toolsoftrade/forkjoinvar.c
>>> @@ -35,11 +35,11 @@ int main(int argc, char *argv[])
>>>  	if (pid == 0) { /* child */
>>>  		x = 1;					//\lnlbl{setx}
>>>  		printf("Child process set x=1\n");	//\lnlbl{print:c}
>>> -		exit(EXIT_SUCCESS);			//\lnlbl{exit:s}
>>> +		exit(EXIT_SUCCESS);
>>>  	}
>>>  	if (pid < 0) { /* parent, upon error */
>>>  		perror("fork");
>>> -		exit(EXIT_FAILURE);
>>> +		exit(EXIT_FAILURE);			//\lnlbl{exit:s}
>>>  	}
>>>  
>>>  	/* parent */
>>>
>>> ------------------------------------------------------------------------
>>>
>>> When I typed "make", I got this:
>>>
>>> ------------------------------------------------------------------------
>>>
>>> $ make
>>> sh utilities/autodate.sh >autodate.tex
>>> ./utilities/gen_snippet_mk.pl > CodeSamples/snippets.mk
>>> Use of uninitialized value $_ in substitution (s///) at ./utilities/gen_snippet_mk.pl line 47.
>>> Use of uninitialized value $_ in concatenation (.) or string at ./utilities/gen_snippet_mk.pl line 48.
>>> echo > qqz.tex
>>> echo > contrib.tex
>>> echo > origpub.tex
>>> make -C CodeSamples -f snippets.mk
>>> make[1]: Entering directory `/home/git/perfbook/CodeSamples'
>>>  --> toolsoftrade/toolsoftrade.fcv
>>>  Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
>>>  make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
>>>  make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
>>>  make: *** [perfbook_flat.tex] Error 2
>>>
>>> ------------------------------------------------------------------------
>>
>> There is one thing I'd like to confirm.
>> Did you do "make" just after checking out the trial branch (before
>> modifying forkjoinvar.c)?
> 
> Yes.  I pulled your changes, typed "make", modified forkjoinvar.c,
> typed "make" again, and then saw the failure.  When I next modified
> forkjoinvar.c yet again and yet again typed "make", no failure.
> 
>> I can't reproduce the above issue on the head of the branch.
> 
> Hmmm...  Let me try again.
> 
> 1.	Checkout origin/master, type "make".  Builds fine.
> 
> 2.	Checkout your most recent branch, type "make".  Builds fine.
> 
> 3.	Apply diff.  Builds fine.
> 
> So I cannot reproduce, either.  Hate it when that happens.  :-/
> 
> But all the .fcv files would be left around, which might be influencing
> things.  Let's remove those and try again.
> 
> 1.	Checkout origin/master, type "make".  Builds fine.
> 
> 2.	Checkout your most recent branch, type "make".  This now fails:
> 
> $ make
> sh utilities/autodate.sh >autodate.tex
> ./utilities/gen_snippet_mk.pl > CodeSamples/snippets.mk
> Use of uninitialized value $_ in substitution (s///) at ./utilities/gen_snippet_mk.pl line 47.
> Use of uninitialized value $_ in concatenation (.) or string at ./utilities/gen_snippet_mk.pl line 48.
> echo > qqz.tex
> echo > contrib.tex
> echo > origpub.tex
> make -C CodeSamples -f snippets.mk
> make[1]: Entering directory `/home/git/perfbook/CodeSamples'
> toolsoftrade/pcreate.c --> toolsoftrade/pcreate@mythread.fcv
>  --> toolsoftrade/toolsoftrade.fcv
> Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
> make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
> make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
> make: *** [perfbook_flat.tex] Error 2
> 

Hmm... I still can't reproduce.
The error message suggests failure to generate CodeSamples/snippets.mk

Might be a mismatch in perl version.

I've tested perl 5.18.2 on Ubuntu 14.04 and 5.22.1 on Ubuntu 16.04.
perl 5.16.3 on CentOS 7 also works fine.

What version of perl are you using?

> 3.	Type "make" again.  Builds fine.
> 
>> In the middle of the branch, there is a point when CodeSamples/snippets.mk
>> resides in the repository. It might have newer time stamp than the
>> modified forkjoinvar.c. (Well, I'don't think this is likely...)
> 
> I didn't test any but your last commit, if that is what you are asking.
> 
>> I'll add a recipe to remove CodeSamples/snippets.mk by "make clean".
>> You'll be able to do "make clean; make" if something goes wrong.
> 
> Adding that and the .fcv files to "make clean" sounds like a good thing
> in general.  Give or take my experience when the .fcv files were missing,
> anyway.  ;-)
> 
> Except that "make clean" already removes at least some of the .fcv files.
> And the top-level snippets.mk file.  Ah, but not CodeSamples/snippets.mk.
> 
>>> I typed "make" again and no errors.  Plus it did update as I expected it
>>> to.  And when I changed it back, it built the first time without errors.
>>
>> Ah, you don't reproduce it once "make" succeeds. Hmm...
>>
>>> Do I perhaps have a shortcoming in my (admittedly ancient) environment?
>>> Or is this something that happens the first time the new functionality
>>> is exercised on a change?
>>
>> Build script changes might need "make clean" after "git pull".
>> (Current HEAD doesn't remove snippets.mk even by "make neatfreak", though.)
> 
> If I do "rm CodeSamples/toolsoftrade/*.fcv", "make clean", and then
> "make", I get this:

Actually, "make clean" removes those generated "*.fcv" files.
In the recipe of "clean", CodeSamples/snippets.mk is invoked by
	$(MAKE) -C CodeSamples -f snippets.mk clean

> 
> $ make
> sh utilities/autodate.sh >autodate.tex
> future/ibmqx2-labeled.svg --> future/ibmqx2-labeled.png
> echo > qqz.tex
> echo > contrib.tex
> echo > origpub.tex
> make -C CodeSamples -f snippets.mk
> make[1]: Entering directory `/home/git/perfbook/CodeSamples'
> toolsoftrade/pcreate.c --> toolsoftrade/pcreate@mythread.fcv
>  --> toolsoftrade/toolsoftrade.fcv
> Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
> make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
> make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
> make: *** [perfbook_flat.tex] Error 2
> 

This means removing CodeSamples/snippets.mk in "make clean" does not help
you.

Hmm...

         Akira

> Then another "make" works fine.> 
>> I also have some other updates in build scripts to add dependencies to
>> code/makefile generation scripts themselves. Will submit another pull request
>> when it's ready.
> 
> Sounds very good!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> But even so, this is -way- more convenient than my old approach of doing
>>> all the changes by hand!!!
>>>
>>> 							Thanx, Paul
>>>
>>
> 

