Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ryP+vBGcRT8pC5DUxpzfNMv0epAHmYY1b/gjIZnCOLE=;
 b=vRVXOta2dZk5rK5kCRm/oBAlb5SJ4oSMabfIpYQSLbSAN0rfwtePAt2/l8B/6R4WzA
 TSiLcy69NB/nVhUXT6YESEV4T5jlnlgiMsdWZZSn9gmF67BdC0ZNhZQeYUOomEL7CpZX
 7Iahhd1kLiAc+MImB27gvXGGBlML6rC+prk1pZBstAXLd6Z4cWYuKEd61GuhD+0TnVRL
 xZIpkqixeKv2WFTx+6uWmHP5KXLQrQwjkm+cNBL3WDuCF3CPVqRj6RdbsBc+OjJhRWDd
 f2kdr3uw1puqO9j4hMnqgj5YV9QrZyvtf1Y4khE4Uqh5UwZO9F0pucwMUnahNarwz58M
 kxPg==
Subject: Re: [PATCH] Tweak width of epigraph for two-column layout
References: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
 <20160726152216.GY7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <86975302-4961-0437-8170-df9e12145390@gmail.com>
Date: Thu, 28 Jul 2016 00:07:27 +0900
MIME-Version: 1.0
In-Reply-To: <20160726152216.GY7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/26 08:22:16 -0700, Paul E. McKenney wrote:
> On Tue, Jul 26, 2016 at 11:49:16PM +0900, Akira Yokosawa wrote:
>> >From aa7969fe4675ab8ee3c7da0470b04f90574b641c Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 26 Jul 2016 20:31:20 +0900
>> Subject: [PATCH] Tweak width of epigraph for two-column layout
>>
>> The default of \epigraphwidth is .5\textwidth.
>> It is too wide for two-column layout.
>> This commit modifies it to .65\columnwidth for two-column
>> layout.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I am not so sure about this.  For example, see Chapter 3's epigraph,
> which ends up with a separate line for the last word.  Ditto for the
> "Glossary and Bibliography", and Appendix A.
> 
> Chapter 16 ends up with a piled-high epigraph, as does Chapter 7.
> 
> Of course, the one-column version has similarly compressed epigraphs.
> 
> So I am wondering if it might be better to leave the two-column
> epigraph width alone and to expand the single-column epigraph width.
> 
> Thoughts?

Okay. To give the same width of epigraph for both one- and two-column
layouts, I'm sending a patch that sets an absolute length for
\epigraphwidth as a reply to this message. This is a bit narrower than
the original two-column one, but it seems OK to me. What do you think? 

                                          Thanks, Akira.

> 
> 							Thanx, Paul
> 
>> ---
>>  perfbook.tex | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/perfbook.tex b/perfbook.tex
>> index 9216485..24fffc6 100644
>> --- a/perfbook.tex
>> +++ b/perfbook.tex
>> @@ -102,6 +102,10 @@
>>  \setlength{\evensidemargin}{-4pt}
>>  }{}
>>
>> +\IfTwoColumn{
>> +\setlength{\epigraphwidth}{0.65\columnwidth}
>> +}{}
>> +
>>  \setcounter{secnumdepth}{3}
>>
>>  \frontmatter
>> -- 
>> 1.9.1
>>
>>
> 
> 

