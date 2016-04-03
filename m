Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:33135 "EHLO
 mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1752802AbcDCWaL (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3
 Apr 2016 18:30:11 -0400
Received: by mail-pa0-f65.google.com with SMTP id q6so18684103pav.0 for
 <perfbook@vger.kernel.org>; Sun, 03 Apr 2016 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0XygFqZQT/DFfn/vYXdIxIFCo6TcVd3+HtIN0UkWueI=;
 b=kQzsKt31KMfC1On3SkABNHFtDjUrKU5imzP9KraGP9Gi7Yv9Cw7kZlf5jsZ0FjsyVm
 isSGrRaBooHsrUwlkco5HbaKgYU7SRmeeXpi6gVQVzDlnig8x9biz3LibcEAK2qPmmje
 iFSD0prxDgA90JddUNlkXFg73ezLdkmRHeaB+QFy0FHgOqvFQ8LRShh4xVGlh1p8E3BN
 AG0+VCXI6cXpzgiAybo0FRJTcRHszFHQZN+jpg4lDxJcJ/YnW+4PObGojyNsMkJmbrtD
 wTYCDTMwzAu2gZWQXPPZYNZmMBla/hIkBmWbNiIHnQ9ZmPbLNv2THkEw+LlK/QJVHb9e
 Zc6w==
From: SeongJae Park <sj38.park@gmail.com>
Date: Mon, 4 Apr 2016 07:30:06 +0900 (KST)
Subject: Re: [PATCH 3/6] advsync: use latex reference feature consistently
In-Reply-To: <20160403133732.GJ3663@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.10.1604040728190.22948@hxeon>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
 <1459556911-11538-4-git-send-email-sj38.park@gmail.com>
 <20160403133732.GJ3663@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: SeongJae Park <sj38.park@gmail.com>, dhowells@redhat.com, perfbook@vger.kernel.org

Hello,

On Sun, 3 Apr 2016, Paul E. McKenney wrote:

> On Sat, Apr 02, 2016 at 09:28:28AM +0900, SeongJae Park wrote:
>> References to other sections in `Advanced Synchronization` chapter use
>> latex reference feature and section name direct citation inconsistently.
>> Because most other parts are using latex reference feature and it is
>> easier for document maintainance, it would be better to use latex
>> reference feature only.  For the reason, this commit enforces latex
>> reference feature to the references.
>>
>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>
> One issue below, please fix and resubmit.

Sure.  I will resubmit in reply to this mail.

>
>> ---
>>  advsync/memorybarriers.tex | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index 15de36a..ee9312d 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -1454,7 +1454,8 @@ memory system as time progresses.  All stores before a write barrier will
>>  occur in the sequence \emph{before} all the stores after the write barrier.
>>
>>  $\dagger$ Note that write barriers should normally be paired with read
>> -or data dependency barriers; see the ``SMP barrier pairing'' subsection.
>> +or data dependency barriers; see the
>> +Section~\ref{sec:advsync:SMP Barrier Pairing}.
>>
>>  \paragraph{Data Dependency Barriers}
>>
>> @@ -1479,19 +1480,19 @@ time the barrier completes, the effects of all the stores prior to that
>>  touched by the load will be perceptible to any loads issued after the data
>>  dependency barrier.
>>
>> -See the ``Examples of memory barrier sequences'' subsection for diagrams
>> -showing the ordering constraints.
>> +See the Section~\ref{sec:advsync:Examples of Memory Barrier Pairings} for
>> +diagrams showing the ordering constraints.
>>
>>  $\dagger$ Note that the first load really has to have a
>>  \emph{data} dependency and
>>  not a control dependency.  If the address for the second load is dependent
>>  on the first load, but the dependency is through a conditional rather than
>>  actually loading the address itself, then it's a \emph{control} dependency and
>> -a full read barrier or better is required.  See the ``Control dependencies''
>> -subsection for more information.
>> +a full read barrier or better is required.  See the
>> +Section~\ref{sec:advsync:Control Dependencies} for more information.
>>
>>  $\dagger$ Note that data dependency barriers should normally be paired with
>> -write barriers; see the ``SMP barrier pairing'' subsection.
>> +write barriers; see the Section~\ref{sec:advsync:SMP Barrier Pairign}.
>
> The above gets me a LaTeX error, could you please fix and resubmit?
> It is good practice to verify that it builds beforehand.  ;-)

Oh, my fault... Sorry and thanks for your kind comment :)  I will fix it
and resubmit in reply to this mail as soon as possible.

>
> 							Thanx, Paul
>
>>
>>  \paragraph{Read Memory Barriers}
>>
>> @@ -1593,7 +1594,8 @@ of the confines of a given architecture:
>>  \item	There is no guarantee that a CPU will see the correct order
>>  	of effects from a second CPU's accesses, even \emph{if} the second CPU
>>  	uses a memory barrier, unless the first CPU \emph{also} uses a matching
>> -	memory barrier (see the subsection on ``SMP Barrier Pairing'').
>> +	memory barrier (see the
>> +	Section~\ref{sec:advsync:SMP Barrier Pairing}).
>>  \item	There is no guarantee that some intervening piece of off-the-CPU
>>  	hardware\footnote{
>>  		This is of concern primarily in operating-system kernels.
>> --
>> 1.9.1
>>
>
>
