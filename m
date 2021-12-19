Return-Path: <SRS0=YRbX=RE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qPYPv2gp3yjKnxQ/H9T/fBCyabc75087TT0e95zbgxU=;
        b=HpsX557/VHix6LrKs/I38UPhQkhCvAmv8Qa1TppKUZpgeOf5DD4ziYrNhpwp9R5nrs
         V7Whb/I6aGmKHL6GBXvnHZpGgqOfqnuh6gjlN3py+nanI57px824AipfnNVw1pRwcQVa
         abc8l6njKY77Vf7RTL/hJxXSQWZ83WxB6kw9iBz4jxoDsHQ+m1SFTT3ybTfAcaeZ6fq1
         PgB5GoYHLDYzrQj4FkUa7xFJwTPeWx+Ali8l01Kv69CdX/uBBovU3kAY1x4BC1XuSsJH
         eIBFYqlY3CaQSClLB40s6iey3pv9gSdwpjD+geoaKPFhC9eVEo6ga9mcbP6H/9I8Nbth
         4QPw==
Subject: Re: [PATCH -perfbook] defer: Simplify SVG files for compatibility
 with browsers
References: <713d5a73-f4ea-f415-fe25-a42c11d248ac@gmail.com>
 <20211217172315.GW641268@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7242e6ef-4533-47ae-95a6-8cbb21786c7e@gmail.com>
Date: Sun, 19 Dec 2021 13:31:54 +0900
MIME-Version: 1.0
In-Reply-To: <20211217172315.GW641268@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 17 Dec 2021 09:23:15 -0800, Paul E. McKenney wrote:
> On Fri, Dec 17, 2021 at 11:14:50PM +0900, Akira Yokosawa wrote:
>> RCUspacetime.svg and RCUusecases.svg are not properly rendered
>> in a browser.
>>
>> By reverse converting from properly-rendered PDF, we are lucky to
>> obtain browser-compatible SVGs of these figures.
>>
>> Steps of reverse conversion (example for defer/RCUusecases.svg):
>>
>>   1. Generate a properly rendered PDF with fixsvgfonts.sh applied:
>>
>>         make defer/RCUusecases.pdf
>>
>>   2. Confirm the PDF looks OK.
>>   3. Export as plain-SVG from PDF (Inkscape >= 1.0):
>>
>>         inkscape -l -o defer/RCUusecases.svg defer/RCUusecases.pdf
>>
>>      ,or with Inkscape < 1.0:
>>
>>         inkscape -l defer/RCUusecases.svg defer/RCUusecases.pdf
>>
>>   4. Confirm the plain-SVG looks OK in a browser.
>>   5. Confirm that the plain-SVG can be edited by Inkscape.
>>
>> Note: Plain-SVG is a SVG format where Inkscape-specific attributes
>>     and UI settings are removed.  It is meant for portability across
>>     different SVG editors.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued and pushed, thank you!
> 
>> ---
>> Hi Paul,
>>
>> You might want to call this "Inkscape black magic!".
>> But it works as far as these two figures are concerned.
>>
>> It's up to you whether or not taking this.
>> At least this change reduces their sizes almost by half.
> 
> Even better!
> 
>> Note that simply saving a problematic SVG as a plain-SVG by
>> Inkscape, exported SVG is still not compatible with browsers.
> 
> Ouch!!!
> 
>> As a matter of fact, texts in RCUusecases.svg at current master can
>> not be edited in Inkscape 1.1.1 in my test even after upgrouping
>> texts.  For example, font size can not be changed.
>>
>> After the reverse conversion to plain-SVG, their font sizes become
>> changeable.
> 
> And editing is significantly less cranky, so thank you again!

Well, changing font sizes might be possible, but the result is not
what you would expect.

When Inkscape imports PDF, texts are divided into words and
each letter in a word has explicit x-position specified.
All spaces are lost along the way.

This means when you increase font size or change font style,
position of each letter does not change, resulting in bad looking
texts.

So I'm beginning to think that this patch should be reverted
despite the browser incompatibility.

I'll see further for the way to make these SVGs both editable
and browser compatible, maybe after the upcoming release of
perfbook.

Sorry for making noise by proposing the crude approach of
PDF -> SVG conversion.

List of commits to be reverted:
  89115b70dc0f ("defer: Update RCUusecases.svg grouping")
  305b778abcb8 ("defer: Simplify SVG files for compatibility with browsers")

        Thanks, Akira
--
> 
> I adjusted grouping and fixed a pre-existing alignment issue.
> The resulting .svg rendered fine in Chrome, so here is hoping!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira

