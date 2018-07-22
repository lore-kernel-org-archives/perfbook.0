Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S+0si8TO56aNQ9AxVeLJF5HJT13rPSjoJ00XF2aUxas=;
 b=bXy8kFxLE2E0NWEJIaT6Q1F4jk4NGYd0Ge68gJcmP3Nf64pLlK8xu864sKjVWTJUyZ
 9453mgZQa8F9slrExeR6MLW1etZy40c3nOIjqbyubKGhN1l0zmvV1fFyT+SxrpNTCR+i
 +qhj+W2xaxQXJUqDyeocJ8xPbQqkfzf/f1GAz3iodUeOdPuolNUcbG+/tgoJBmM/lgms
 9QaXXy7KBC/tRSVLJAGfMPFe7KPGKX5N4ktHI0uL9fFUImF3JooA1Y38lr+DFzo4KDuf
 nYMn0ydBrjOXsx+8XXMHZOEae3Tqx7ioQHpAm5OfUyzrs5djuUhS2OW8FoPnS2cQzJoE
 ZIEw==
Subject: Re: [NOT YET PULL] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <20180721165103.GE12945@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <977b5bf7-f4eb-8b0e-a320-e9eef3c8f8e3@gmail.com>
Date: Mon, 23 Jul 2018 00:43:05 +0900
MIME-Version: 1.0
In-Reply-To: <20180721165103.GE12945@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/07/21 09:51:03 -0700, Paul E. McKenney wrote:
> On Sat, Jul 21, 2018 at 09:19:53AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> So, an experimental branch to label particular lines in code
>> snippets is ready for review.
>> The branch is based on current master of yours.
>>
>> I've converted 4 code snippets in Section 4.2. and updated
>> corresponding code samples (sans forkjoin.c because it is
>> quite simplified in Listing 4.1).
>>
>> Does this approach look reasonable to you?
> 
> This does look promising, thank you!  Please give me some time to think
> this over a bit.  My normal approach would end up with very long labels
> in the code, which might be OK.  The argument against is that tying the
> listing caption to the actual code might not be a great thing.

One idea is to embed meta labels in code samples.
When converting them to a proper Verbatim sources, short labels such
as " //\lnlbl{foo}" can be converted to long ones such as
"%lnlbl[ln:<chapter>:<basename of snippet file>:foo]" in the script
to remove " //".

To do this, we need to embed extra meta data as comments in sample
code.

For example, the source of waitall() function (in api-pthread.h) can be
written as the following (in the form of \lnlbl{}):

----
/*
 * Wait on all child processes.
 */
static __inline__ void waitall(void)
{
// \begin{snippet}[chapter=toolsoftrade,name=waitall,commandchars=[\%\[\]]
	int pid;
	int status;

	for (;;) {				//\lnlbl{loopa}
		pid = wait(&status);		//\lnlb{wait}
		if (pid == -1) {
			if (errno == ECHILD)	//\lnlb{ECHILD}
				break;		//\lnlbl{break}
			perror("wait");		//\lnlbl{perror}
			exit(EXIT_FAILURE);	//\lnlbl{exit}
		}
		poll(NULL, 0, 1);
	}					//\lnlbl{loopb}
}
// \end{snippet}
...
----

, and it can be extracted and converted into CodeSamples/api-pthread/waitall.tex
in the following way (including substitution of escape charactors):

\begin{Verbatim}[commandchars=[\%\[\]]
	int pid;
	int status;

	for (;;) {%lnlbl[ln:toolsoftrade:waitall:loopa]
		pid = wait(&status);%lnlbl[ln:toolsoftrade:waitall:wait]
		if (pid == -1) {
			if (errno == ECHILD)%lnlbl[ln:toolsoftrade:waitall:ECHILD]
				break;%lnlbl[ln:toolsoftrade:break]
			perror("wait");%lnlbl[ln:toolsoftrade:perror]
			exit(EXIT_FAILURE);%lnlbl[ln:toolsoftrade:exit]
		}
		poll(NULL, 0, 1);
	}%lnlbl[ln:toolsoftrade:loopb]
}
\end{Verbatim}

This file can be read in toolsoftrade.tex in the following way:

---
\begin{listing}[tbp]
\input{CodeSamples/api-pthread/waitall}
\caption{Using the \tco{wait()} Primitive}
\label{lst:toolsoftrade:Using the wait() Primitive}
\end{listing}
---

The conversion script should not be so hard to implement.
Update of build scripts should also be possible to automate these
conversions.

If you'd like to use the caption of the listing in the final labels,
the caption should also be given in the meta \begin{snippet} command.
But for lines in code snippets, using file names as labels sounds
reasonable to me.

Thoughts?

        Thanks, Akira

> 
> Again, looks promising, thank you!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>> ---
>> The following changes since commit e3191997557e0d33b862e267fb4d5971e879ca07:
>>
>>   utilities: Provide scripts instead of broken symlinks (2018-07-18 11:40:57 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook trial-fancyvrb
>>
>> for you to fetch changes up to 2154a175e469e6238c89d4c494d204a9ddbaa20a:
>>
>>   [EXP] Update hyphen2endash (2018-07-21 09:17:34 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (3):
>>       [EXP] toolsoftrade: Add labels in code samples as comments
>>       [EXP] toolsoftrade: Reference line in code snippets by label
>>       [EXP] Update hyphen2endash
>>
>>  CodeSamples/api-pthreads/api-pthreads.h |  14 +-
>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  10 +-
>>  CodeSamples/toolsoftrade/pcreate.c      |   5 +-
>>  perfbook.tex                            |   6 +
>>  toolsoftrade/toolsoftrade.tex           | 221 +++++++++++++++++---------------
>>  utilities/hyphen2endash.sh              |   3 +
>>  6 files changed, 141 insertions(+), 118 deletions(-)
>>
> 

