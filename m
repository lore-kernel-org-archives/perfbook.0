Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wusta6EtXtrqLOTm4pAEO8GQ3RKXTc1NMczgpJri0Vw=;
 b=BK4v9Am2lu7BsicJtpdUucM+G+S0WHw7mMuHtM19R6tOcmmRlPgY8RJLkuT/SddtRD
 fLcTfWkOwn3pAKe73hX3hEnqlFEGwsWzeqYTGadWhSL+q2YyWkvCTHGLOo3JNp0smTv+
 W5Buj6mF+pLcCeKOeOQ7pdAJ/YdzgPiVjH7MXFoNHy+DqTSLcid3ObDz4cZDak9AEhXD
 hbpateMiD6qnmTrxqCqhKKWkI6iRnsyhANsaLmWhMve2nhm8Znmx1Z/daGiYgrMB8VzL
 1ciqvNOv3c/JfgBXTzU2W3kfUtRcPyVyVR47qYkUOTbBcz0bcRNfelKjB+dSn9qmktHz
 dXBg==
Subject: Re: [NOT YET PULL v2] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <7f933561-fa81-8006-0c7d-a30e6eb93682@gmail.com>
 <20180731151027.GP24813@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ffbbce4e-48c5-e325-5fd9-c98f474f48c4@gmail.com>
Date: Thu, 2 Aug 2018 00:24:50 +0900
MIME-Version: 1.0
In-Reply-To: <20180731151027.GP24813@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/07/31 08:10:27 -0700, Paul E. McKenney wrote:
> On Tue, Jul 31, 2018 at 01:04:18AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is v2 of the trial of fancyvrb scheme.
>>
>> ---
>> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
>>
>>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180730a
>>
>> for you to fetch changes up to 3361b7331cf0f08a75bf6a9f69b7ea2f126e3b75:
> 
> Looks very nice!
> 
> So the effect of these are to establish a "label name environment"?
> 
> \renewcommand{\lnlblbase}{ln:toolsoftrade:forkjoin:main}
> \renewcommand{\lnrefbase}{ln:toolsoftrade:forkjoin:main}

Yes.
Another approach would be to define a *real* environment and
enclose those parts where \lnref{} commands are used inside the
environment.

If we name the environment "lineref", the LaTeX source would
look like:

    \begin{lineref}[ln:toolsoftrade:forkjoin:main]
    If \co{fork()} succeeds, it returns twice, once for the parent
    and again for the child.
    [...]
    Otherwise, the \co{fork()} has executed successfully, and the parent
    therefore executes line~\lnref{parent} with the variable \co{pid}
    containing the process ID of the child.
    \end{lineref}

This might be clearer to see where the label-base string is
effective.

\lnlblbase could also have its own environment defined.

I'll try this approach in v3 of this branch.

        Thanks, Akira

> 
> This is very good -- allows use of short names, but also avoids
> managing a very large flat global namespace.
> 
> Then the C++ comments containing the "snippet" commands automate
> code extraction, plus those containing the "lnlbl" commands to
> automate label generation.
> 
> This looks extremely good to me.  It makes it much easier to modify
> the code and the discussion of that code.
> 
> Any thoughts from others?
> 
> 						Thanx, Paul
> 
>>   [EXP] Automate sub makefile update (2018-07-31 00:31:56 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (6):
>>       [EXP] toolsoftrade: Add labels in code samples as comments
>>       [EXP] Add script to extract code snippet from code sample
>>       [EXP] toolsoftrade: Reference line in code snippets by label
>>       [EXP] Update hyphen2endash
>>       [EXP] Add *.fcv to .gitignore
>>       [EXP] Automate sub makefile update
>>
>>  .gitignore                              |   2 +
>>  CodeSamples/api-pthreads/api-pthreads.h |  18 ++--
>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 ++-
>>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
>>  Makefile                                |  14 ++-
>>  perfbook.tex                            |  12 +++
>>  toolsoftrade/toolsoftrade.tex           | 174 ++++++++++----------------------
>>  utilities/fcvextract.pl                 | 166 ++++++++++++++++++++++++++++++
>>  utilities/gen_snippet_mk.pl             |  55 ++++++++++
>>  utilities/hyphen2endash.sh              |   3 +
>>  10 files changed, 322 insertions(+), 141 deletions(-)
>>  create mode 100755 utilities/fcvextract.pl
>>  create mode 100755 utilities/gen_snippet_mk.pl
>>
>> ---
>>
>> There are quite a few changes since v1:
>>
>>     o Rebased to current master.
>>     o Use line label format of "ln:directory:filename:function:linelabel"
>>     o To avoid repetitive use of long labels in reference, introduce
>>       \lnlblbase and \lnrefbase macros. By this change, now \lnlbl{} and
>>       \lnref{} can have simple line labels.
>>     o Add a script to extract VerbatimL sources from code samples.
>>     o Add a script to generate sub makefile for snippet extraction.
>>     o Update Makefile accordingly.
>>
>> The scheme looks like to work for 90% of code snippets.
>>
>> TODO list for me to improve:
>>
>>     o Support of code snippets other than "C".
>>     o Support option to meta command \begin{snippet} other than labelbase and
>>       commandchars.
>>     o Support of commandchars option with no escape charactor required
>>
>> If this looks ready for you to merge, I'll amend commit logs and
>> add header comment to gen_snippets_mk.pl and send a proper pull request.
>> Please try this branch and let me know what you think.
>>
>>         Thanks, Akika
>>
> 

