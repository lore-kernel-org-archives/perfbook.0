Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bdGTTrtTf+lIsdjaL3bUqf/ZZk3+MkNcZcgHPTk/I1c=;
 b=mCm8C8tKWoWLo+C52pBPdiBnD/KKIq+XShfKW8h8O+wJov6JIwq08Cv8ZNUSVfkjOW
 5ONCFRSzP23cxlhZoYr4lhsOEAUHM0cGQ8XzWitjQpXioA3FDkTq9hzhKprkf5BWXGIP
 vUoy8nJQhZJ8lKWJrbtsUaaJLeIWnTXh+Kgqd4I4ZwgOybpGd1NfYJGJDtU3Nv3AUJ9p
 qPOY6UJN677P+dHbEPtDwbHgeC3l3DbSy19DwTlgC2L55DIUB7nbCQQNivMApqNozlWi
 v8BpdFQXLwMVvXfn3gUascJ4ZEzn2REhip0Pa0KjZYZZr4ZHwvu8kXfSnwtgUfIXwyTd
 M7OQ==
Subject: Re: [NOT YET PULL] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <20180721165103.GE12945@linux.vnet.ibm.com>
 <977b5bf7-f4eb-8b0e-a320-e9eef3c8f8e3@gmail.com>
 <20180722224906.GI12945@linux.vnet.ibm.com>
 <76c70153-62c6-e675-fc53-9ce233337552@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3a77a91b-6747-0d23-df5e-382c073f48aa@gmail.com>
Date: Tue, 24 Jul 2018 00:12:17 +0900
MIME-Version: 1.0
In-Reply-To: <76c70153-62c6-e675-fc53-9ce233337552@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/07/24 00:09:37 +0900, Akira Yokosawa wrote:
> On 2018/07/22 15:49:06 -0700, Paul E. McKenney wrote:
>> On Mon, Jul 23, 2018 at 12:43:05AM +0900, Akira Yokosawa wrote:
>>> On 2018/07/21 09:51:03 -0700, Paul E. McKenney wrote:
>>>> On Sat, Jul 21, 2018 at 09:19:53AM +0900, Akira Yokosawa wrote:
>>>>> Hi Paul,
>>>>>
>>>>> So, an experimental branch to label particular lines in code
>>>>> snippets is ready for review.
>>>>> The branch is based on current master of yours.
>>>>>
>>>>> I've converted 4 code snippets in Section 4.2. and updated
>>>>> corresponding code samples (sans forkjoin.c because it is
>>>>> quite simplified in Listing 4.1).
>>>>>
>>>>> Does this approach look reasonable to you?
>>>>
>>>> This does look promising, thank you!  Please give me some time to think
>>>> this over a bit.  My normal approach would end up with very long labels
>>>> in the code, which might be OK.  The argument against is that tying the
>>>> listing caption to the actual code might not be a great thing.
>>>
>>> One idea is to embed meta labels in code samples.
>>> When converting them to a proper Verbatim sources, short labels such
>>> as " //\lnlbl{foo}" can be converted to long ones such as
>>> "%lnlbl[ln:<chapter>:<basename of snippet file>:foo]" in the script
>>> to remove " //".
>>>
>>> To do this, we need to embed extra meta data as comments in sample
>>> code.
>>>
>>> For example, the source of waitall() function (in api-pthread.h) can be
>>> written as the following (in the form of \lnlbl{}):
>>>
>>> ----
>>> /*
>>>  * Wait on all child processes.
>>>  */
>>> static __inline__ void waitall(void)
>>> {
>>> // \begin{snippet}[chapter=toolsoftrade,name=waitall,commandchars=[\%\[\]]
>>> 	int pid;
>>> 	int status;
>>>
>>> 	for (;;) {				//\lnlbl{loopa}
>>> 		pid = wait(&status);		//\lnlb{wait}
>>> 		if (pid == -1) {
>>> 			if (errno == ECHILD)	//\lnlb{ECHILD}
>>> 				break;		//\lnlbl{break}
>>> 			perror("wait");		//\lnlbl{perror}
>>> 			exit(EXIT_FAILURE);	//\lnlbl{exit}
>>> 		}
>>> 		poll(NULL, 0, 1);
>>> 	}					//\lnlbl{loopb}
>>> }
>>> // \end{snippet}
>>> ...
>>> ----
>>>
>>> , and it can be extracted and converted into CodeSamples/api-pthread/waitall.tex
>>> in the following way (including substitution of escape charactors):
>>>
>>> \begin{Verbatim}[commandchars=[\%\[\]]
>>> 	int pid;
>>> 	int status;
>>>
>>> 	for (;;) {%lnlbl[ln:toolsoftrade:waitall:loopa]
>>> 		pid = wait(&status);%lnlbl[ln:toolsoftrade:waitall:wait]
>>> 		if (pid == -1) {
>>> 			if (errno == ECHILD)%lnlbl[ln:toolsoftrade:waitall:ECHILD]
>>> 				break;%lnlbl[ln:toolsoftrade:break]
>>> 			perror("wait");%lnlbl[ln:toolsoftrade:perror]
>>> 			exit(EXIT_FAILURE);%lnlbl[ln:toolsoftrade:exit]
>>> 		}
>>> 		poll(NULL, 0, 1);
>>> 	}%lnlbl[ln:toolsoftrade:loopb]
>>> }
>>> \end{Verbatim}
>>>
>>> This file can be read in toolsoftrade.tex in the following way:
>>>
>>> ---
>>> \begin{listing}[tbp]
>>> \input{CodeSamples/api-pthread/waitall}
>>> \caption{Using the \tco{wait()} Primitive}
>>> \label{lst:toolsoftrade:Using the wait() Primitive}
>>> \end{listing}
>>> ---
>>>
>>> The conversion script should not be so hard to implement.
>>> Update of build scripts should also be possible to automate these
>>> conversions.
>>>
>>> If you'd like to use the caption of the listing in the final labels,
>>> the caption should also be given in the meta \begin{snippet} command.
>>> But for lines in code snippets, using file names as labels sounds
>>> reasonable to me.
>>
>> I believe that your scheme is pretty close.  My thought is directory,
>> file, function, label.  You have all but file already.  That allows
>> captions to change without changing the line label, which seems like a
>> good thing.
> 
> In the end, "chapter=foo,name=bar,func=baz" can be expressed as
> "labelprefix=foo:bar:baz in the option to meta \begin{snippet} command.

I meant:

  "labelprefix=foo:bar:baz"

Akira

> So you can put any string you like there.
> 
> I'll do v2 of the trial branch along this scheme, hopefully
> including build script/Makefile updates.  Maybe in a week or so.
> 
>        Thanks, Akira
>  
>>
>> Seem reasonable?
>>
>> 							Thanx, Paul
>>
>>> Thoughts?
>>>
>>>         Thanks, Akira
>>>
>>>>
>>>> Again, looks promising, thank you!
>>>>
>>>> 							Thanx, Paul
>>>>
>>>>>         Thanks, Akira
>>>>>
>>>>> ---
>>>>> The following changes since commit e3191997557e0d33b862e267fb4d5971e879ca07:
>>>>>
>>>>>   utilities: Provide scripts instead of broken symlinks (2018-07-18 11:40:57 -0700)
>>>>>
>>>>> are available in the git repository at:
>>>>>
>>>>>   https://github.com/akiyks/perfbook trial-fancyvrb
>>>>>
>>>>> for you to fetch changes up to 2154a175e469e6238c89d4c494d204a9ddbaa20a:
>>>>>
>>>>>   [EXP] Update hyphen2endash (2018-07-21 09:17:34 +0900)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Akira Yokosawa (3):
>>>>>       [EXP] toolsoftrade: Add labels in code samples as comments
>>>>>       [EXP] toolsoftrade: Reference line in code snippets by label
>>>>>       [EXP] Update hyphen2endash
>>>>>
>>>>>  CodeSamples/api-pthreads/api-pthreads.h |  14 +-
>>>>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  10 +-
>>>>>  CodeSamples/toolsoftrade/pcreate.c      |   5 +-
>>>>>  perfbook.tex                            |   6 +
>>>>>  toolsoftrade/toolsoftrade.tex           | 221 +++++++++++++++++---------------
>>>>>  utilities/hyphen2endash.sh              |   3 +
>>>>>  6 files changed, 141 insertions(+), 118 deletions(-)
>>>>>
>>>>
>>>
>>
> 

