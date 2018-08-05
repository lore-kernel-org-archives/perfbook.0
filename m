Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dw1RvznbYvk3r81dKXSZD1Hq+RJNhzY4vA9ou99IiQg=;
 b=BmovfaNqHDuBY3HI9TCL8aDYvh5YZZ6rZcp0g5LRoSHN8Kh4VKmjJn6VUxEtM5inFn
 HRt5CH2FTKE/DIa/Gp5+fo6jgCu2YTDLV9wCgkozBMP8jYBhmGz2h/JHeqwsp7PQ8mIb
 WB3vWrvYHZPMOMT0UO+Dd+KdKiqpTx979s9PfYqLl+wnVogPXqmPY/qiKcSEPmQHgX0h
 zAiMbdr5Jd/ZKMHB0G3WkMq05J3BnLJQchRaA82vlUlQO1VjC+wMRIDx0nAWyTqefu1C
 k+2vQV3yKms7wcd4CoSgAa4ny4rovwqSD0tTYZIUEWZLqts0WZteVNJcwGJ/XHw08Y5U
 I2UA==
Subject: Re: [GIT PULL v5] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
 <20180805163508.GI24813@linux.vnet.ibm.com>
 <20180805165448.GA9869@linux.vnet.ibm.com>
 <9b6c0ec9-1b73-ecfb-62bc-7289bd6fe383@gmail.com>
 <20180805224719.GJ24813@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c5ef5787-27dd-bbcd-5d48-81bee1b64d3b@gmail.com>
Date: Mon, 6 Aug 2018 08:26:03 +0900
MIME-Version: 1.0
In-Reply-To: <20180805224719.GJ24813@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/08/05 15:47:19 -0700, Paul E. McKenney wrote:
> On Mon, Aug 06, 2018 at 06:58:20AM +0900, Akira Yokosawa wrote:
>> On 2018/08/05 09:54:48 -0700, Paul E. McKenney wrote:
>>> On Sun, Aug 05, 2018 at 09:35:08AM -0700, Paul E. McKenney wrote:
>>>> On Sun, Aug 05, 2018 at 09:06:27AM +0900, Akira Yokosawa wrote:
>>>>> Hi Paul,
>>>>>
>>>>> This is hopefully the final version of this trial branch.
>>>>>
>>>>> Changes since v4:
>>>>>
>>>>>     o Instead of generating CodeSamples/snippets.mk and calling it from
>>>>>       main Makefile, generate CodeSamples/snippets.d which contains
>>>>>       only dependencies and include it in the Makefile.
>>>>>
>>>>> This change can fix the error you encountered in the previous version.
>>>>> I'm just hoping...
>>>>
>>>> Hmmmm...
>>>>
>>>> 	$ make
>>>> 	sh ./utilities/gen_snippet_d.sh
>>>> 	CodeSamples/toolsoftrade/pcreate.c --> CodeSamples/toolsoftrade/pcreate@mythread.fcv
>>>>
>>>> But "make 2c" works.  This might be because I don't have the
>>>> PERFBOOK_DEFAULT environment variable set?  Except that the Makefile code
>>>> looks like this would have the default "make all" have the same effect as
>>>> "make 2c".  Color me confused.
>>
>> No. It was my fault. I failed to test the simple "make".
>> To override my env variable setting of "PERFBOOK_DEFUALT=msnt 1csf",
>> I tend to use one of "make msnt" or "make msnt 1csf" or "make 2c".
>>
>> I see the same behavior when I do simple "make" regardless
>> of PERFBOOK_DEFAULT is set or unset.
> 
> Been there, done that!  ;-)
> 
>>>> Anyway, yes, when I do "make 2c" it correctly reacts to moving labels
>>>> around in CodeSamples/toolsoftrade/forkjoinvar.c, so that is good!
>>>>
>>>> Here is the output of "make -v", in case that matters:
>>>>
>>>> 	GNU Make 3.81
>>>> 	Copyright (C) 2006  Free Software Foundation, Inc.
>>>> 	This is free software; see the source for copying conditions.
>>>> 	There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>>>> 	PARTICULAR PURPOSE.
>>>>
>>>> 	This program built for x86_64-pc-linux-gnu
>>>
>>> And the diff below restores the behavior I would expect for "make",
>>> even when modifying tags in CodeSamples/toolsoftrade/forkjoinvar.c,
>>> though of course it might well break something else.  (And the diff
>>> happens to include my test change to forkjoinvar.c.)
>>>
>>> Thoughts?
>>>
>>> 							Thanx, Paul
>>>
>>> ------------------------------------------------------------------------
>>>
>>> diff --git a/Makefile b/Makefile
>>> index fe9f63f43e55..3e9e2c2ebf3c 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -85,13 +85,6 @@ endif
>>>  SOURCES_OF_SNIPPET := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
>>>  GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
>>>  
>>> -ifeq ($(MAKECMDGOALS),clean)
>>> -else ifeq ($(MAKECMDGOALS),distclean)
>>> -else ifeq ($(MAKECMDGOALS),neatfreak)
>>> -else
>>> --include CodeSamples/snippets.d
>>> -endif
>>> -
>>>  default = $(PERFBOOK_DEFAULT)
>>>  
>>>  ifeq ($(default),)
>>> @@ -103,6 +96,13 @@ endif
>>>  .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help
>>>  all: $(targ)
>>>  
>>> +ifeq ($(MAKECMDGOALS),clean)
>>> +else ifeq ($(MAKECMDGOALS),distclean)
>>> +else ifeq ($(MAKECMDGOALS),neatfreak)
>>> +else
>>> +-include CodeSamples/snippets.d
>>> +endif
>>> +
>>>  2c: perfbook.pdf
>>>  
>>>  mslm: perfbook-mslm.pdf
>>
>> This change works for me too.
>>
>> Do you want me to add the change to the trial branch?
>> I don't mind if you add the change yourself with my
>>
>> Acked-by: Akira Yokosawa <akiyks@gmail.com>
>>
>> Of course, the following diff should be omitted.
> 
> I pushed out an akiyks.2018.08.05a branch with the commit (but without
> the forkjoinvar.c change), and with your ack.
> 
> When you say it is ready, I will bring my master branch out to that
> commit.  Or if you have another pull request for an updated version
> of this series, I will replace it with that.

I amended the commit log.
Appended is the pull request. See below.

        Thanks, Akira

> 
> Either way, please let me know!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
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
>>
> 

--- 
The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:

  Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git trial-fancyvrb-20180805a

for you to fetch changes up to 78141e64d4629b29643634fc1d334233f108f656:

  Makefile: Fix "make" behavior (2018-08-06 08:18:49 +0900)

----------------------------------------------------------------
Akira Yokosawa (12):
      toolsoftrade: Add labels in code samples as comments
      Add script to extract code snippet from code sample
      toolsoftrade: Reference line in code snippets by label
      Update hyphen2endash
      Add *.fcv to .gitignore
      Automate sub makefile update
      Specify lmtt font for VerbatimM env
      toolsoftrade: Use \lnlbl in inline code snippet
      Add 'linelabel' and 'lineref' environment
      Catch failure in genaration of CodeSamples/snippets.mk
      Add dependencis to scripts for extracting code snippets
      Add dependencies of perfbook_flat.tex to CodeSamples/.../*.fcv files

Paul E. McKenney (1):
      Makefile: Fix "make" behavior

 .gitignore                              |   2 +
 CodeSamples/api-pthreads/api-pthreads.h |  18 +--
 CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
 CodeSamples/toolsoftrade/pcreate.c      |   7 +-
 Makefile                                |  25 +++-
 perfbook.tex                            |  21 ++++
 toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
 utilities/fcvextract.pl                 | 168 +++++++++++++++++++++++++
 utilities/gen_snippet_d.pl              |  65 ++++++++++
 utilities/gen_snippet_d.sh              |   8 ++
 utilities/hyphen2endash.sh              |   3 +
 11 files changed, 382 insertions(+), 158 deletions(-)
 create mode 100755 utilities/fcvextract.pl
 create mode 100755 utilities/gen_snippet_d.pl
 create mode 100644 utilities/gen_snippet_d.sh


