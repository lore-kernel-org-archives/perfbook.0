Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3A8h9oooNPCscl3OA7GZv3e0AHfyFcNzw+sD0Tg2Xtk=;
 b=Fb9atqVxJv02qQ9yi/s/Qc9iojZv+XYZ6s6hwBvJVVJNk0QuqKgADdXsFS0Vr3juY2
 dLjaOBRClVEWHVmvUtumfYASCpNbmEbDRWu/16ZLDyEtipaf4BmoGJALGXm6ivmpJWuA
 VJx4DVRDZoKVlcVHB4xR1S395JsH55FAjE3eMLWWAex4ZTIj77pjQ5cpObFKbstXabnQ
 R+I98NjpoE59zev739I0DZGwfXQswzlpbjQBW1RAWxPexHb2mbWNVdGabc4irvZ4XOZV
 4YyQVhIvZtVl9eOqHIiF7sE+2uSFQ3cB8NI+4YWeql9WKPUfHDx162ybkH4HzghYVs/i
 jE0g==
Subject: Re: [PATCH 0/5] Style guide updates
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
 <20170813172624.GA7017@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bcd15a7a-b8c6-b59a-1cc6-669ea41c5aba@gmail.com>
Date: Mon, 14 Aug 2017 08:24:08 +0900
MIME-Version: 1.0
In-Reply-To: <20170813172624.GA7017@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/08/13 10:26:24 -0700, Paul E. McKenney wrote:
> On Sun, Aug 13, 2017 at 12:27:52PM +0900, Akira Yokosawa wrote:
>> >From 24d4de52c8186c1ec1787e76d13e22646d804a53 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 13 Aug 2017 11:00:48 +0900
>> Subject: [PATCH 0/5] Style guide updates
>>
>> Hi Paul,
>>
>> The style guide needs some updates regarding recent changes in
>> litmus tests in memory barriers section. (Patch #3)
>> Also I recovered the tweaks in table layout. I added another
>> option to color rows alternately. (Patch #1 and #2)
>> Patch #4 is my attempt to convince you that using commas for
>> digit grouping should be regarded as harmful in global POV.
>> My suggestion is to use \num{} commands in LaTeX source and
>> let a reader to pick a style of his/her choice.
>>
>> \num{} command can slow down pdflatex processing somewhat,
>> but should be acceptable on modern platforms.
>>
>> Thoughts?
> 
> Applied and pushed, thank you!
> 
> Table D.3 looks fine, but it only has thee columns.  If it had more
> columns or was wider or variable-depth rows, it would be hard to read.

And I said in the guide, "especially in tables of simple structure."
Large tables need case-by-case tuning, I suppose.

> Table D.4 looks good to me, but I (intentionally) have not yet looked
> at what you had to do in LaTeX to make it happen.  ;-)

For the coloring, all I did was adding a command
"\rowcolors{1}{}{lightgray}".
The (not so) hard part was to make the header row to be actually
one row. I used parbox for the moment.
Please give a look when you have time.

         Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (5):
>>   styleguide: Add examples of alternative table layout
>>   styleguide: Tweak layout of 'Limitation' table
>>   styleguide: Update LaTeX source of code snippet
>>   styleguide: Add example of options to \num{} command
>>   styleguide: Emphasize source part of epigraph
>>
>>  appendix/styleguide/samplecodesnippet.tex    |  19 --
>>  appendix/styleguide/samplecodesnippetfig.tex |  19 ++
>>  appendix/styleguide/samplecodesnippetlst.tex |  19 ++
>>  appendix/styleguide/styleguide.tex           | 375 ++++++++++++++++++---------
>>  perfbook.tex                                 |   5 +-
>>  5 files changed, 301 insertions(+), 136 deletions(-)
>>  delete mode 100644 appendix/styleguide/samplecodesnippet.tex
>>  create mode 100644 appendix/styleguide/samplecodesnippetfig.tex
>>  create mode 100644 appendix/styleguide/samplecodesnippetlst.tex
>>
>> -- 
>> 2.7.4
>>
> 
> 

