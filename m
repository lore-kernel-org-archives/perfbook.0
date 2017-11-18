Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=axSUjalGU1NcA+PY88hb6Zh80Y0EYZcKignDhBtM3eg=;
 b=Kh0TEZwIyUZJsyMTBjQHjYxLBLMuD/uHOYWox8ZoFn7B6kn5WVbCfm+RldFtGWrpMT
 g8aBJnB9iA6kmKh/W+YPj0rW7xzndLDm6ZzmHhkibvRuAy2H7wjg903IMlGcPeQwvYV1
 g9w55ibLiSO5H6iQcZIXXuHwqa9iR7SQn8rtz+dmRVQ8J7wAVDN9EYaDGy5IGYJOrNkT
 n49m0MAGpWFCrnERqt8ipVUtTuUz5SAdQx0O6yu6CjsNoADpyfaZkHxs7tSdjcuP03hW
 lc9I/c0cNTI5dEhVWRD603XwAByczET0WMnVaLNsHyTmJjoX4oZVymOsSuuk1AMGiiT1
 n+/w==
Subject: Re: [PATCH 3/3] memorder: Fix trivial typo
References: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
 <c2a30f43-d49c-807f-ffe0-e51bf1b3d639@gmail.com>
 <20171118201027.GM3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <563e2b06-c296-61a5-7380-81c07566f98d@gmail.com>
Date: Sun, 19 Nov 2017 07:43:44 +0900
MIME-Version: 1.0
In-Reply-To: <20171118201027.GM3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/11/18 12:10:27 -0800, Paul E. McKenney wrote:
> On Sun, Nov 19, 2017 at 12:07:02AM +0900, Akira Yokosawa wrote:
>> >From a2d0cd80fb99a15bd5265f12863ac8f0183f9a9b Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 18 Nov 2017 23:39:26 +0900
>> Subject: [PATCH 3/3] memorder: Fix trivial typo
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I applied all three, and especially like the script taking up some
> of the manual handling of quick quizzes with figures!
> 
> One thing I left out, please see below.
> 
> 							Thanx, Paul
> 
>> ---
>>  memorder/memorder.tex | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index 68dc09b..d11df62 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -10,7 +10,7 @@ Causality and sequencing are deeply intuitive, and hackers often
>>  tend to have a much stronger grasp of these concepts than does
>>  the general population.
>>  These intuitions can be extremely powerful tools when writing, analyzing,
>> -and debugging both sequential code and parallel code that makes
>> +and debugging both sequential code and parallel code that make
>>  use of standard mutual-exclusion mechanisms, such as locking and
>>  RCU.
>>  Unfortunately, these intuitions break down completely in face of
> 
> If it was "intuitions" that made use of "standard mutual-exclusion
> mechanisms", this fix would be correct.  Plural "intuitions" would
> require plural "make".  (And no, I have no idea why English adds "s"
> to nouns to denote plural, but removes "s" from verbs to denote plural.
> Probably because it is English...)
> 
> But it is "code" that made use of "standard mutual-exclusion mechanisms".
> I am treating "code" like "water", that is, "lines of code" would be
> plural (like "molecules of water"), but "code" is singular (like "water").

I see. What happened in my mind was a dumb pattern match with:

    "Both X and Y that makes use of ..."

> 
> I also treat "data" as singular, that is, as a collective noun.  This
> is controversial, and people who like "data" to be plural probably also
> like "code" to be plural when referring to lines of code.
> 
> https://en.wikipedia.org/wiki/Data_(word)
> 
> And it appears that most people are now willing to put up with "data"
> as a collective noun when applied to computers.  Others are probably
> still protesting that "data" is the plural form of "datum" in Latin.
> 
> But, yes, English!  :-/

Yes. "data" always bother/bothers me...  :-(

      Thanks, Akira

> 
> 							Thanx, Paul
> 
>> @@ -38,7 +38,7 @@ follows up with more detail on what representative hardware platforms
>>  actually do to unwary parallel programmers.
>>  Finally, Section~\ref{sec:memorder:Where is Memory Ordering Needed?}
>>  provides some rules of thumb for what situations require parallel
>> -programmers to take special action to preserver memory ordering.
>> +programmers to take special action to preserve memory ordering.
>>
>>  \section{Ordering: Why and How?}
>>  \label{sec:memorder:Ordering: Why and How?}
>> -- 
>> 2.7.4
>>
>>
> 
> 

