Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=KueVXu3hQwLgkQbEp1F3hPVK1AD0EQqP/DwARpEynp8=;
 b=aK/xoHx3vzsmHT1mkzHuMLwCzqTQduBzwOnftg6iuo85sKwT68Z5KfNcKl7GXE7/tr
 Rab42YiG2PIxDcbcMYkozAvjSn/UhhYuq/TPtSFOCb9W71twBFkyzXLD5c3oQzNlWb3n
 S4++Gkpqu2ZX1KhpQnq8e5gDf597gNYxnBQ4vI2bGhrER+CsZgn8pa1Za1Xw2OdiUl4x
 xJbgmN63ZAJBikWYcIdfyanyIq4eMZUUamzULkIvQtIZlYtdseaW7XYnmCDb3TZMr2sZ
 /HJao6vOFcOGckC5IsbVdB/2FspRYC8C+Sr/g9fkmWMQ5gnxSmjYroLywg9VZ5G9D7Lb
 DLdw==
Subject: Re: [GIT PULL] Cosmetic fixes round 3 and other fixes
References: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
 <20160710144141.GW4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7bc131c6-d5af-f8b7-dbf3-53de265ea5a7@gmail.com>
Date: Mon, 11 Jul 2016 00:08:11 +0900
MIME-Version: 1.0
In-Reply-To: <20160710144141.GW4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/10 23:41, Paul E. McKenney wrote:
> On Sat, Jul 09, 2016 at 03:24:51PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Today, because of the weather, I have time to do clean up the cosmetic
>> fixes. Appended are two pull requests.
>
> Very good!  I pulled both and pushed them out.  I made a small change
> to the label for the table that you (rightly) changed to a figure,
> so that it is prefixed by "tab:" rather than "fig:".
>

Oh, I missed those labels...

So, I reviewed latex source of recently added figures.
You are still using 'center' environment within 'figure' environment.
That will cause extra small vertical spacing between the body of the
figure and its caption.

In stead of doing such as:

\begin{figure}[tb]
\begin{center}
\resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
\end{center}
\caption{foo bar}
\label{fig:foo bar}
\end{figure}

please do this way:

\begin{figure}[tb]
\centering
\resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
\caption{foo bar}
\label{fig:foo bar}
\end{figure}

Also, there are templates in ".Templates/figure-graphics" that
use the 'center' environment. They should also be fixed to use
\centering instead.

For reference, please see (for example):

http://tex.stackexchange.com/questions/2651/should-i-use-center-or-centering-for-figures-and-tables

for people's opinions. (The long URL might be wrapped arround)

                                            Thanks, Akira

> 							Thanx, Paul
>
>> 1st one is of *non-cosmetic* fixes which are mostly typo fixes but
>> requires careful review.
>>
>> Note that the 1st commit "future: Miscellaneous possible fixes" contains
>> both non-cosmetic and cosmetic fixes. I thought of separating them,
>> but it is not so large and I assume it is not so difficult to review.
>> If you don't agree, please blame me.
>>
>> The last commit "Add 'hypcap' package to make hyperref go to top of
>> figure and table" modifies the behavior of Table and Figure links
>> in PDF. I think this is an improvement.
>>
>> 2nd request is of *costmetic* fixes which are mostly the same fixes
>> I have done lately. But there are other types of fixes included here.
>>
>> In qqz, there are a few unnecessary paragraph breaks that affect the
>> layout of Appendix D. On the other hand, there are a few places that
>> require paragraph breaks but miss blank lines in the source.
>> Those commits beginning with "qqz: " fix them.
>>
>> The commits "Use \centering instead of center environment (part 1 -- 5)"
>> abandon the use of "center" environment within "table" and "figure"
>> environments and replac them with simple \centering commands.
>> They remove extra vertical spaces above captions. These commits
>> touch a lot of places and cause the large diff stats.
>>
>> The following 3 commits tweaks layout and size of Tables and Figures.
>> The changes made in commit "Tweak sizes and positions of Tables and
>> Figures" should be thought of as tentative tweaks. And I'm not sure
>> the editor likes the tweaks.
>>
>> The last commit "SMPdesign: Restore effect of \cleardoublepage" is
>> added because the changes made in this series result in a denser
>> overall layout.
>>
>> Note that "future: Miscellaneous possible fixes" is picked on both
>> branches to avoid conflicts with later commits.
>>
>>                                                 Thanks, Akira
>>
>> ---
>> The following changes since commit 009dcf8d442c61859cdbf06b221c9fbb5aa5fb91:
>>
>>   Add RT chapter to the Section 1.1 roadmap (2016-07-08 19:55:22 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git non-cosmetic-fixes
>>
>> for you to fetch changes up to 749479a4fa1cb9564b6683dd267fb99f4bdf5110:
>>
>>   Add 'hypcap' package to make hyperref go to top of figure and table (2016-07-09 12:59:32 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (7):
>>       future: Miscellaneous possible fixes
>>       future: Use \QuickQuizARef{} for reference to QQA
>>       after: Typo fixes
>>       time: Typo fix
>>       Typo fixes in Quick Quizzes
>>       rt: Typo fix in QQA
>>       Add 'hypcap' package to make hyperref go to top of figure and table
>>
>>  advsync/memorybarriers.tex   |  2 +-
>>  appendix/questions/after.tex |  4 ++--
>>  appendix/questions/time.tex  |  2 +-
>>  future/HTMtable.tex          |  3 ++-
>>  future/HTMtableRCU.tex       |  2 +-
>>  future/future.tex            |  4 ++--
>>  future/htm.tex               | 16 ++++++++--------
>>  future/tm.tex                |  6 +++---
>>  locking/locking.tex          |  2 ++
>>  perfbook.tex                 |  1 +
>>  rt/rt.tex                    |  2 +-
>>  together/applyrcu.tex        |  2 +-
>>  12 files changed, 25 insertions(+), 21 deletions(-)
>>
>> ---
>> The following changes since commit 009dcf8d442c61859cdbf06b221c9fbb5aa5fb91:
>>
>>   Add RT chapter to the Section 1.1 roadmap (2016-07-08 19:55:22 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git cosmetic-fixes-round-3
>>
>> for you to fetch changes up to 67aae72180cbe2743b011ca5c0f123b3dffc41bc:
>>
>>   SMPdesign: Restore effect of \cleardoublepage (2016-07-09 13:42:24 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (21):
>>       future: Miscellaneous possible fixes
>>       after: Centering figures of verbatim code examples
>>       after: Tweak font size of Figure A.2
>>       after: Use \path command for path names
>>       primitives: Use \path for path name
>>       primitives: Centering figures of verbatim code examples
>>       qqz: Replace redundant blank lines with comment lines
>>       qqz: Use \minipage{} environment for code snippet
>>       qqz: Add blank lines for proper paragraph breaks
>>       qqz: More replacement of redundant blank lines with comment lines
>>       appendix: Centering tables and figures
>>       Use \centering instead of center environment (part 1)
>>       Use \centering instead of center environment (part 2)
>>       Use \centering instead of center environment (part 3)
>>       Use \centering instead of center environment (part 4)
>>       Use \centering instead of center environment (part 5)
>>       toolsoftrade: qqa: Add paragraph break around minipage
>>       SMPdesign: Tweak table 'Schematic of Real-World Parallel Allocator'
>>       defer: Use 'tabulary' for some tables
>>       Tweak sizes and positions of Tables and Figures
>>       SMPdesign: Restore effect of \cleardoublepage
>>
>>  SMPdesign/SMPdesign.tex              | 89 +++++++++++++++---------------------
>>  SMPdesign/beyond.tex                 | 36 +++++----------
>>  SMPdesign/partexercises.tex          | 38 ++++++---------
>>  advsync/memorybarriers.tex           | 76 +++++++++++++-----------------
>>  advsync/rcu.tex                      | 18 +++-----
>>  appendix/primitives/primitives.tex   | 42 ++++++++++-------
>>  appendix/questions/after.tex         | 33 +++++++------
>>  appendix/questions/time.tex          |  3 +-
>>  appendix/rcuhist/RCUinLinux.tex      |  9 ++--
>>  appendix/rcuimpl/rcupreempt.tex      | 30 ++++--------
>>  appendix/rcuimpl/rcutree.tex         | 27 ++++-------
>>  appendix/rcuimpl/rcutreewt.tex       | 12 ++---
>>  appendix/rcuimpl/srcu.tex            |  9 ++--
>>  appendix/whymb/whymemorybarriers.tex | 67 ++++++++++++---------------
>>  count/count.tex                      | 47 ++++++++-----------
>>  cpu/hwfreelunch.tex                  |  3 +-
>>  cpu/overheads.tex                    | 10 ++--
>>  cpu/overview.tex                     | 24 ++++------
>>  datastruct/datastruct.tex            | 78 ++++++++++++-------------------
>>  debugging/debugging.tex              | 20 +++-----
>>  defer/defer.tex                      |  5 +-
>>  defer/hazptr.tex                     |  2 +-
>>  defer/rcuapi.tex                     | 65 ++++++++++++--------------
>>  defer/rcufundamental.tex             | 21 +++------
>>  defer/rcuintro.tex                   |  9 ++--
>>  defer/rcuusage.tex                   | 42 +++++++----------
>>  defer/refcnt.tex                     | 11 +++--
>>  defer/seqlock.tex                    |  5 +-
>>  defer/toyrcu.tex                     | 16 +++----
>>  defer/whichtochoose.tex              |  3 +-
>>  easy/easy.tex                        |  6 +--
>>  formal/axiomatic.tex                 |  4 +-
>>  formal/dyntickrcu.tex                |  3 +-
>>  formal/spinhint.tex                  | 10 ++--
>>  future/HTMtable.tex                  |  6 +--
>>  future/HTMtableRCU.tex               |  7 ++-
>>  future/cpu.tex                       | 24 ++++------
>>  future/future.tex                    |  4 +-
>>  future/htm.tex                       | 22 +++++----
>>  future/tm.tex                        | 18 +++-----
>>  intro/intro.tex                      | 18 +++-----
>>  locking/locking.tex                  | 27 ++++-------
>>  perfbook.tex                         |  1 +
>>  rt/rt.tex                            | 48 +++++++------------
>>  toolsoftrade/toolsoftrade.tex        | 15 +++---
>>  45 files changed, 439 insertions(+), 624 deletions(-)
>>
>
>

