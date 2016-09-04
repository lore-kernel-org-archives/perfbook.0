Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=F6KhGBSemrwWsbtRrtriai3wtqtCDiUynY5zTlOgPhY=;
 b=V47yqap5dv11jXGMfRV1u4fkxL1PMUUp8T0lkhKOB1y3kugQJPPUASy/kNVr46NDOE
 AmTsQd9C8kjmZAJ8SbM3mUxq+znYpX01w8mwPB+tWPDh25gY4B6uGwhtjfEf1Mc29/lI
 vvch88GreOvE3c6kockmyXG0z/CiYCqfjxXEQ8h1/0moove2AsXvwBUcXIpqCzqYDRo4
 WFOEQoC2THVLtxQQduPrD3RzNCndndKmScD4owERHABo1az4dC/ymdJA6JIwI57OoRO6
 w/fTubgKHR4jnTo8JNbzOS7DoNNuFDPucnmdwtLxptnqjvMIzxwa/CrxDYmqjKiAwKe/
 pmfQ==
Subject: Re: [PATCH] treewide: Add \noindent where necessary
References: <a5ebf9e5-a315-7603-2262-af0e363bb83c@gmail.com>
 <20160904095821.GO3663@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <269e7880-07e9-43f6-70c9-b1d321b3e442@gmail.com>
Date: Sun, 4 Sep 2016 23:53:53 +0900
MIME-Version: 1.0
In-Reply-To: <20160904095821.GO3663@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/04 02:58:21 -0700, Paul E. McKenney wrote:
> On Sun, Sep 04, 2016 at 08:44:27AM +0900, Akira Yokosawa wrote:
>> >From e11254e95c6d33eaf999a1e1c4831af2e141fb91 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 4 Sep 2016 08:01:50 +0900
>> Subject: [PATCH] treewide: Add \noindent where necessary
>>
>> Since commit 213f584cd55b ("Add a few epigraphs") and following
>> commits, implicit no-indentation of first paragraph of a Chapter
>> has been lost.
>>
>> This commit adds explicit "\noindent" after \epigraph{}s.
>>
>> It also adds "\noindent" where some environment is used just
>> after "\section{}", "subsection{}", or "subsubsection{}.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good eyes!  I honestly had not noticed.

Well, now I know why.  In the two-column layout, there was no change
in indentation of the first paragraph of a chapter...
I suppose you mostly see the two-column layout so it's natural you
didn't see any difference.

I don't know why, but when you specify "twocolumn" option to the "book"
documentclass, the first paragraph of a chapter *is* indented.

I noticed the difference in perfbook-1c.pdf first, and wrongly assumed
it was also the case in two-column layout.

Sorry for my confusion.

I have no idea if the behavior of twocolumn option is intended or not.

So the addition of epigraphs actually made the indentation consistent
in both two-column and one-column layout.

I can resubmit a patch that only changes at the first paragraphs of
sections.

> 
> But wouldn't it make more sense to fix the epigraph package?  For that
> matter, what exactly are the rules regarding epigraphs and indentation
> of first paragraphs and chapters?

\epigraph{} command does have this side-effect in one-column layout.
I found several examples where people use \noindent after \epigraph{},
but there seems to be no strong rules here.

So just doing consistently can be said of as the rule.
It's the editor's call, I think.

                                                Thanks.

> 							Thanxx, Paul
> 
[snip]

