Return-Path: <SRS0=shCP=33=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wMwNAcnStK1JbpzWR5Mo6aN50w7RLH+LhXXUDF1K1GU=;
        b=WKeOoXj0p2MrOmAkgd7822YCFV9HlxWGaq9f4T+LgDnGNiDJERLRjdCTBtC1AZY44+
         lx6Nn/rZDoSoAOKbpLmaX8tvsJJ0I0Zb/oioicK6T8C3AkXn9dS1kaoIEtL83OHbuW26
         hBL9GKmB07B47EjaGWiWH8PPxc3bj2gA4idqVaXMFMXzjAkmMRPHgsLxRmvw8wy/nkel
         Qrr94PUchzzPDAF7+HFcd66hYmLca9hT0QcMK51vxkm372y0kFIl6/Oz9X2tryUsbQNQ
         TmWHqvyU3hgknqWJ7Pk3Jpy/TCkrA3sOffXOerQJlHr67mSZaaJ6NmhRbdmWcP/t/VGc
         rhTA==
Subject: Re: [PATCH] Permit occasional orphans
References: <8953d302-fa2b-da51-f555-52b0ef94612a@gmail.com>
 <20200207124458.GJ2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <89b759c0-1eb4-c0f8-840d-8a1c9f8ddefc@gmail.com>
Date: Sat, 8 Feb 2020 00:26:49 +0900
MIME-Version: 1.0
In-Reply-To: <20200207124458.GJ2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 7 Feb 2020 04:44:58 -0800, Paul E. McKenney wrote:
> On Fri, Feb 07, 2020 at 07:40:55AM +0900, Akira Yokosawa wrote:
>> >From 6ad4c736867394d765a4b50aba907ef0dd8420ba Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 6 Feb 2020 22:16:28 +0900
>> Subject: [PATCH] Permit occasional orphans
>>
>> Recent update of upstream LaTeX caused excessively wide spaces between
>> paragraphs in 2c layout similar to the issue mentioned in the change
>> log of commit 4c6ee39761a0 ("Remove required version of 'epigraph'")
>> at the beginning of Chapter 6.
>>
>> The root cause of the unstable behavior is the constraints imposed
>> by the unfortunate combination of a fairly tall unbreakable block
>> (consisting of a section heading, a section epigraph, a paragraph
>> of only 3 lines), a footnote, and a floating figure.
>>
>> Note that the "nowidow" package requires at least 4 lines for a
>> paragraph to be broken.
>>
>> An orphan line (first line of a paragraph at the bottom of a page/column)
>> looks less ugly than a widow line (final line of a paragraph at the top
>> of a page/column) does.
>>
>> As a band-aid patch, this commit permits an orphan at the problematic
>> paragraph by the \noclub command provided by the "nowidow" package
>> and avoids such ugly wide spaces.
>> Another approach would be to add some words to the paragraph and
>> make it 4 lines or more.
>>
>> By this change, TeX Live 2015/Debian (on Ubuntu Xenial) with the
>> up-to-date "epigraph" can also produce the (mostly) same output.
>>
>> Do similar tweaks to avoid wide vertical spaces in a couple of other
>> chapters.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued and pushed, thank you!
> 
> I also expanded the paragraph preceeding your \noclub, please check to
> make sure that this really fixes the problem in the other environments.

Yes, now the beginning of Section 6.1 fits in the left column of
the page on both the up-to-date TeX Live 2019 and TeX Live 2015/Debian
with the up-to-date "epigraph".

> 
> This also caused me to wonder about the two-page "think about it" gap
> following the introduction of Dining Philosophers.  Not a problem in> electronic editions, but it looks like a print edition would have a pair
> of pages with only "(Intentional blank page)" in the upper left.  Might
> not be worth worrying about, though.

Ah, blank pages on odd and even pages do look strange.
IIUC, a pair of odd and even pages are printed on both side of a
paper.
If the question is on an even page, to prevent the answer from being spotted
early, it should not be on the next (odd) page but on the next even page.
If the question is on an odd page, the answer may be on the other side
(even page) without any blank page for print edition.

Is my understanding of the problem correct?

So we need to make the added blank page(s) conditional to Edition type,
don't we?

Hopefully I might be able to come up some way to do this soon enough.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>> Hi Paul,
>>
>> As mentioned in the change log, if you add some words to the
>> paragraph in partexercises.tex, the \noclub[1] can be removed.
>> In the other places, the problem is not the length of the
>> paragraph and you need different tweaks to avoid orphans.
>> Let me see what the tweaks would be. 
>>
>>         Thanks, Akira
>>
>>  SMPdesign/partexercises.tex | 1 +
>>  debugging/debugging.tex     | 1 +
>>  locking/locking.tex         | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
>> index 9cebe6b7..1708da93 100644
>> --- a/SMPdesign/partexercises.tex
>> +++ b/SMPdesign/partexercises.tex
>> @@ -12,6 +12,7 @@
>>  
>>  This section uses a pair of exercises (the classic Dining Philosophers
>>  problem and a double-ended queue) to demonstrate the value of partitioning.
>> +\noclub[1]
>>  
>>  \subsection{Dining Philosophers Problem}
>>  \label{sec:SMPdesign:Dining Philosophers Problem}
>> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
>> index 286f6df7..07350fe1 100644
>> --- a/debugging/debugging.tex
>> +++ b/debugging/debugging.tex
>> @@ -2256,6 +2256,7 @@ Section~\ref{sec:debugging:Detecting Interference Via Measurement}
>>  describes methods of rejection involving additional measurements,
>>  while Section~\ref{sec:debugging:Detecting Interference Via Statistics}
>>  describes statistics-based rejection.
>> +\noclub[1]
>>  
>>  \subsubsection{Detecting Interference Via Measurement}
>>  \label{sec:debugging:Detecting Interference Via Measurement}
>> diff --git a/locking/locking.tex b/locking/locking.tex
>> index 3c2949fa..8a1a3101 100644
>> --- a/locking/locking.tex
>> +++ b/locking/locking.tex
>> @@ -1010,6 +1010,7 @@ Therefore CPU~1 will likely acquire the lock.
>>  If CPU~1 holds the lock long enough for CPU~0 to be requesting the
>>  lock by the time CPU~1 releases it and vice versa, the lock can
>>  shuttle between CPUs~0 and~1, bypassing CPUs~2--7.
>> +\noclub[1]
>>  
>>  \QuickQuiz{}
>>  	Wouldn't it be better just to use a good parallel design
>> -- 
>> 2.17.1
>>
