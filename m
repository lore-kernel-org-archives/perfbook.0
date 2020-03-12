Return-Path: <SRS0=KuuI=45=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2HNZ77b4eBcxMambFybvbIwY+Wsyz8sVhp/fm30f0IU=;
        b=NvxWRY7to0pQXMrKFTSsuFoiud6EMuyvwsPAGPROOX0qA6H9h3CzrbifzKVZjLxDID
         Y+Ubqi/TQBymvgzUvAxE0fAgcoCGJVP05tLKNzmGsym5/A/qIURlpsNTo9tWv0c/dCQA
         6LcX62XyNvx+KRNXjIy9yRRV3GtGgQOxTjX3h2MxnsXJXlcGz6f+gZ5E2EgobzBWFrvU
         iAaFo8M4rNBEIAAyHRf0+fQDyuxBNZy3RZ/tVqH625JT8EbGYusm7lexho3puz1qEXXS
         vwzHMqGWW8pnod4fCoBXG5m+tj5pLFMvDX4uV/3GFqtgm5Znq1TUy4XJo/uBID1qLvEx
         vG7w==
Subject: Re: [PATCH] treewide: Use trademark symbols for Intel processor
 families
References: <2842e044-f9b9-2e0f-682b-faeff99338ef@gmail.com>
 <20200312180728.GH3199@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <766edf24-2621-fec9-7bdb-af5f66e806c8@gmail.com>
Date: Fri, 13 Mar 2020 07:29:40 +0900
MIME-Version: 1.0
In-Reply-To: <20200312180728.GH3199@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 12 Mar 2020 11:07:28 -0700, Paul E. McKenney wrote:
> On Fri, Mar 13, 2020 at 12:53:20AM +0900, Akira Yokosawa wrote:
>> >From e4d5b404bcc00b6f9ae0325623fccb6e15c178e7 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 13 Mar 2020 00:30:47 +0900
>> Subject: [PATCH] treewide: Use trademark symbols for Intel processor families
>>
>> As per Intel's guideline [1] of trademark usage, put (R) and (TM)
>> marks in captions and their first references from text within a chapter.
>> Update legal.tex accordingly.
>>
>> [1]: https://www.intel.com/content/www/us/en/trademarks/usage-guidelines.html
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> Having seen the (R) and (TM) marks in the updated tables in cpu/overheads,
>> this patch puts similar marks in other "Intel Xeon", "Intel Core", and "Intel"
>> trademarks.
> 
> Ah, I should have included my explanation.  I simply copied that string
> directly out of /proc/cpuinfo, "(R)" and "(TM)" and all.

Ah, I see.

> 
>> I guess we should also take care of other trademarks of IBM, Arm, MIPS, SPARC,
>> etc.
>>
>> I remember submitting a patch to remove those marks saying that they are covered
>> by the Legal page, but it was not the right thing to do if I had read the
>> guidelines of those trademark owners carefully.
> 
> Hmmm...  What do other textbooks do?

I think you have far more English textbooks at hand than I do. :-)

I still think that those marks are used by trademark owners and their affiliated
parties. I don't think they are required in academic papers/textbooks.

> 
>> If you are OK, I'll prepare a patch set for other trademarks.
> 
> I am OK either way, but I am not yet convinced we need markings
> throughout.  However, I agree that if there is doubt, the safe thing to
> do is to apply the markings.

If we go the opposite way, we might be safe to remove notes on trademarks
in the "Legal Statement" page, mightn't we?

As a compromise, we could add entries of above mentioned trademarks in
the legal page.

One thing we need to take care is the change of "ARM" to "Arm" as a text
trademark.

Thoughts?

        Thanks, Akira

PS:

Is there any plan to add a section on RISC-V in Chapter 15?

> 
> 							Thanx, Paul
> 
>> Thoughts?
>>
>>         Thanks, Akira
>> --
>>  appendix/styleguide/styleguide.tex |  2 +-
>>  count/count.tex                    |  2 +-
>>  cpu/overheads.tex                  | 10 +++++-----
>>  legal.tex                          |  4 ++--
>>  perfbook.tex                       |  4 ++--
>>  toolsoftrade/toolsoftrade.tex      |  2 +-
>>  6 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
>> index 00fa249d..db7cde24 100644
>> --- a/appendix/styleguide/styleguide.tex
>> +++ b/appendix/styleguide/styleguide.tex
>> @@ -1333,7 +1333,7 @@ as a reference to be consulted when new tables are added in the text.
>>  	Global Comms		& 195 000 000	& 409 500 000   \\
>>  	\bottomrule
>>  \end{tabular}
>> -\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
>> +\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel\RTM\ Xeon\RTM\ Platinum 8176 CPUs @ 2.10GHz}
>>  \label{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
>>  \end{table}
>>  
>> diff --git a/count/count.tex b/count/count.tex
>> index a7426e53..244bd004 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -259,7 +259,7 @@ line~\lnref{inc} atomically increments it, and
>>  line~\lnref{read} reads it out.
>>  \end{fcvref}
>>  Because this is atomic, it keeps perfect count.
>> -However, it is slower: on a Intel Core Duo laptop, it is about
>> +However, it is slower: on a Intel\RTM\ Core\TM\ Duo laptop, it is about
>>  six times slower than non-atomic increment
>>  when a single thread is incrementing, and more than \emph{ten times}
>>  slower if two threads are incrementing.\footnote{
>> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
>> index e3fa42bf..702e7cfe 100644
>> --- a/cpu/overheads.tex
>> +++ b/cpu/overheads.tex
>> @@ -161,7 +161,7 @@ optimization.
>>  	Global Comms	& 195 000 000 & 409 500 000 & \\
>>  	\bottomrule
>>  \end{tabular}
>> -\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10\,GHz}
>> +\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel\RTM\ Xeon\RTM\ Platinum 8176 CPUs @ 2.10\,GHz}
>>  \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
>>  \end{table*}
>>  
>> @@ -333,8 +333,8 @@ thousand clock cycles.
>>  	Global Comms		& 195 000 000	& 542 000 000   \\
>>  	\bottomrule
>>  \end{tabular}
>> -\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel X5550 (Nehalem) System}
>> -\label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
>> +\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel\RTM\ X5550 (Nehalem) System}
>> +\label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel(R) X5550 (Nehalem) System}
>>  \end{table}
>>  
>>  	The first problem limits raw speed, and the second limits
>> @@ -350,7 +350,7 @@ thousand clock cycles.
>>  	represents a reasonably large system with no fewer 448~hardware
>>  	threads.
>>  	Smaller systems often achieve better latency, as may be seen in
>> -	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
>> +	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel(R) X5550 (Nehalem) System},
>>  	which represents a much smaller system with only 16 hardware threads.
>>  	A similar view is provided by the rows of
>>  	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
>> @@ -385,7 +385,7 @@ thousand clock cycles.
>>  	Global Comms	& 195 000 000 & 429 000 000 & \\
>>  	\bottomrule
>>  \end{tabular}
>> -\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20\,GHz}
>> +\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel\RTM\ Core\TM\ i7-8750H CPU @ 2.20\,GHz}
>>  \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz}
>>  \end{table*}
>>  
>> diff --git a/legal.tex b/legal.tex
>> index 21b9263f..a6329c9f 100644
>> --- a/legal.tex
>> +++ b/legal.tex
>> @@ -13,8 +13,8 @@ Trademarks:
>>  	of International Business Machines Corporation in the United
>>  	States, other countries, or both.
>>  \item	Linux is a registered trademark of Linus Torvalds.
>> -\item	i386 is a trademark of Intel Corporation or its subsidiaries
>> -	in the United States, other countries, or both.
>> +\item	Intel, Intex Xeon, and Intel Core are trademarks of Intel Corporation
>> +	or its subsidiaries in the United States, other countries, or both.
>>  \item	Other company, product, and service names may be trademarks or
>>  	service marks of such companies.
>>  \end{itemize}
>> diff --git a/perfbook.tex b/perfbook.tex
>> index a5ac180b..61b57ad0 100644
>> --- a/perfbook.tex
>> +++ b/perfbook.tex
>> @@ -277,8 +277,8 @@
>>  \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
>>  \newcommand{\mytexttrademark}{}
>>  \newcommand{\mytextregistered}{}
>> -%\newcommand{\mytexttrademark}{\textsuperscript\texttrademark}
>> -%\newcommand{\mytextregistered}{\textsuperscript\textregistered}
>> +\newcommand{\TM}{\textsuperscript\texttrademark}
>> +\newcommand{\RTM}{\textsuperscript\textregistered}
>>  
>>  \newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
>>  
>> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
>> index 79d6c2cd..3c59760a 100644
>> --- a/toolsoftrade/toolsoftrade.tex
>> +++ b/toolsoftrade/toolsoftrade.tex
>> @@ -2600,7 +2600,7 @@ As a rough rule of thumb, use the simplest tool that will get the job done.
>>  If you can, simply program sequentially.
>>  If that is insufficient, try using a shell script to mediate parallelism.
>>  If the resulting shell-script \co{fork()}/\co{exec()} overhead
>> -(about 480 microseconds for a minimal C program on an Intel Core Duo
>> +(about 480 microseconds for a minimal C program on an Intel\RTM\ Core\TM\ Duo
>>  laptop) is too
>>  large, try using the C-language \co{fork()} and \co{wait()} primitives.
>>  If the overhead of these primitives (about 80 microseconds for a minimal
>> -- 
>> 2.17.1
>>
