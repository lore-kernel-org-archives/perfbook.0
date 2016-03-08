Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=fiice9Ax35szg5dV0L5mLneIVlpSXTYNbMtnXdb+x+o=;
 b=JF9Vws+6M9reY5UL34w5YNEVMd02lkKENgcqm45QiuhGkqd/KFctCQ9k28b//tegK6
 EjVCEs7yh3dplJQdZCHXocr7GD6VvVw+zrRIPZnrdyErqBOIUxufaNnDQvuMrLiP3CIG
 O8hKm6hQ2XvR6DOTXXPB2RZZc533F93AzrNctXeFKRZwjYNoaf4qtfXcnj0zZqzFwbXZ
 VgO87ORt5uskh49RPduI+Hcvru+3EKXvO37Oyc1VC7+ETB7aGYEnMa/3Mxs7dyWGsPJr
 jnCY8NCxL/OLUZH2z0/u0bUJ2v7j5NE/kSL6X4Rmv3JDrduqA2zwIXCh9Ff8fnUzUoRV
 hT5A==
MIME-Version: 1.0
In-Reply-To: <20160308000854.GE3577@linux.vnet.ibm.com>
References: <1457394152-32110-1-git-send-email-sj38.park@gmail.com>
 <20160308000854.GE3577@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Tue, 8 Mar 2016 09:11:47 +0900
Message-ID: 
 <CAEjAshoJF=eb42=h0EAd47_x7u1hL80ZekU8qDcpDPYLjv8i-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] count: fix typos
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Mar 8, 2016 at 9:08 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, Mar 08, 2016 at 08:42:31AM +0900, SeongJae Park wrote:
>> This commit fix typos such as wrong spelling, missed or unnecessarily
>> inserted words and characters in `COUNTING` section.
>
> Could you please resend with your Signed-off-by?  Looks good otherwise.

Oops, I forgot it while squashing commits.  I will send edited version
right now.

>
>                                                         Thanx, Paul
>
>> ---
>>  count/count.tex | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index 83b695f..8f69a10 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -672,7 +672,7 @@ at the beginning of this chapter.
>>       to reduce.
>>       However, the worst case is unchanged because although the
>>       counter \emph{could} move in either direction, the worst
>> -     case is whenthe read operation completes immediately,
>> +     case is when the read operation completes immediately,
>>       but then is delayed for $\Delta$ time units, during which
>>       time all the changes in the counter's value move it in
>>       the same direction, again giving us an absolute error
>> @@ -851,7 +851,7 @@ comes at the cost of the additional thread running \co{eventual()}.
>>       the per-thread \co{counter} variables
>>       might need to be limited to 32 bits in order to sum them accurately,
>>       but with a 64-bit \co{global_count} variable to avoid overflow.
>> -     In this case, it is necessary to zero the per-thead
>> +     In this case, it is necessary to zero the per-thread
>>       \co{counter} variables periodically in order to avoid overflow.
>>       It is extremely important to note that this zeroing cannot
>>       be delayed too long or overflow of the smaller per-thread
>> @@ -1648,7 +1648,7 @@ Then line~34 releases \co{gblcnt_mutex}, and line~35 returns success.
>>
>>  Lines~38-50 show \co{read_count()}, which returns the aggregate value
>>  of the counter.
>> -It acquires \co{gblcnt_mutex} on line~43 and releases it on line 48,
>> +It acquires \co{gblcnt_mutex} on line~43 and releases it on line~48,
>>  excluding global operations from \co{add_count()} and \co{sub_count()},
>>  and, as we will see, also excluding thread creation and exit.
>>  Line~44 initializes local variable \co{sum} to the value of
>> @@ -2262,7 +2262,7 @@ then line~25 returns failure.
>>
>>  Otherwise, line~28 adds \co{delta} to the global counter, line~29
>>  spreads counts to the local state if appropriate, line~30 releases
>> -\co{gblcnt_mutex} (again, as noted earlier), and finally, line 31
>> +\co{gblcnt_mutex} (again, as noted earlier), and finally, line~31
>>  returns success.
>>
>>  Lines~34-63 of
>> @@ -2305,7 +2305,7 @@ Line~9 acquires \co{gblcnt_mutex} and line~16 releases it.
>>  Line~10 initializes local variable \co{sum} to the value of
>>  \co{globalcount}, and the loop spanning lines~11-15 adds the
>>  per-thread counters to this sum, isolating each per-thread counter
>> -using \co{split_ctrandmax} on line 13.
>> +using \co{split_ctrandmax} on line~13.
>>  Finally, line~17 returns the sum.
>>
>>  \begin{figure}[tbp]
>> @@ -2432,7 +2432,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>>  \QuickQuiz{}
>>       What stops a thread from simply refilling its
>>       \co{ctrandmax} variable immediately after
>> -     \co{flush_local_count()} on line 14 of
>> +     \co{flush_local_count()} on line~14 of
>>       Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
>>       empties it?
>>  \QuickQuizAnswer{
>> @@ -2449,7 +2449,7 @@ line~30 subtracts this thread's \co{countermax} from \co{globalreserve}.
>>       What prevents concurrent execution of the fastpath of either
>>       \co{add_count()} or \co{sub_count()} from interfering with
>>       the \co{ctrandmax} variable while
>> -     \co{flush_local_count()} is accessing it on line 27 of
>> +     \co{flush_local_count()} is accessing it on line~27 of
>>       Figure~\ref{fig:count:Atomic Limit Counter Utility Functions 1}
>>       empties it?
>>  \QuickQuizAnswer{
>> @@ -2542,7 +2542,7 @@ Even though per-thread state will now be manipulated only by the
>>  corresponding thread, there will still need to be synchronization
>>  with the signal handlers.
>>  This synchronization is provided by the state machine shown in
>> -Figure~\ref{fig:count:Signal-Theft State Machine}
>> +Figure~\ref{fig:count:Signal-Theft State Machine}.
>>  The state machine starts out in the IDLE state, and when \co{add_count()}
>>  or \co{sub_count()} find that the combination of the local thread's count
>>  and the global count cannot accommodate the request, the corresponding
>> @@ -3576,7 +3576,7 @@ Summarizing the summary:
>>       counters' partitioned updates and non-partitioned reads), but also
>>       across time (as in
>>       Section~\ref{sec:count:Approximate Limit Counters}'s and
>> -     Section~\ref{sec:count:Exact Limit Counters}'s and
>> +     Section~\ref{sec:count:Exact Limit Counters}'s
>>       limit counters running fast when far from
>>       the limit, but slowly when close to the limit).
>>  \item        Partitioning across time often batches updates locally
>> @@ -3585,7 +3585,7 @@ Summarizing the summary:
>>       improving performance and scalability.
>>       All the algorithms shown in
>>       Tables~\ref{tab:count:Statistical Counter Performance on Power-6}
>> -     and~\ref{tab:count:Limit Counter Performance on Power-6}?
>> +     and~\ref{tab:count:Limit Counter Performance on Power-6}
>>       make heavy use of batching.
>>  \item        Read-only code paths should remain read-only:  Spurious
>>       synchronization writes to shared memory kill performance
>> --
>> 1.9.1
>>
>

