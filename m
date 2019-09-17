Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pg1-f169.google.com ([209.85.215.169]:33906 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfIQP2j (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 17 Sep 2019 11:28:39 -0400
Received: by mail-pg1-f169.google.com with SMTP id n9so2226324pgc.1
        for <perfbook@vger.kernel.org>; Tue, 17 Sep 2019 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=37JjCyamJU7fPCIXwNuDpaneKqB5a6DTw5ZDgw2iarY=;
        b=fdaI9cMym5i3y6OcvCyktajiiOtT6Y8jV+C/ZzlzsE76v2znJ3SzcWV1QoGRPqvB1/
         cFcvHM5NEy7IyjifW9uxBp1WnxMdiDE3hUP1La2+oTAfpRrvZ0DTuiWZJj4qDf5GbeK2
         7AYcZfJik7nuOXV1MWk2M2NjIJwEcuIJcys97x+PmEF5GjwJaODa9nOJoVwd57P8/7ny
         gMgr0FvMRHOK5hD+B/U2+tRUpCoStSnrOdU2XFRyPad59LjbhW89HivDAjDMRRpPKkkn
         16x7eZ9ZaKhWscZbiDNk1CTAJuH0xNCKhIDsOC5XkaOx8Y5+e9mu/SxmUvOPHGleNX+s
         DVnQ==
Subject: Re: Fix pdflatex ToC
References: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
 <36156427-7c2b-130b-41b6-a18b425eff2e@gmail.com>
 <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
Date: Wed, 18 Sep 2019 00:28:32 +0900
MIME-Version: 1.0
In-Reply-To: <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>

On Tue, 17 Sep 2019 21:05:55 +1000, Balbir Singh wrote:
> On Mon, Sep 16, 2019 at 7:33 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>>
>> (CC to Paul's current address)
>> Hi Balbir,
>>
>> On Mon, 16 Sep 2019 08:21:54 +1000, Balbir Singh wrote:
>>> From df15e226d96614ffbdedfd517f8a6d7afc1c0fee Mon Sep 17 00:00:00 2001
>>> From: Balbir singh <bsingharora@gmail.com>
>>> Date: Sun, 15 Sep 2019 21:14:53 +1000
>>> Subject: [PATCH] Make hyperlinks colorful and a browsable pdf TOC
>>>
>>> Without these changes the the PDF does not provide
>>> a browsable TOC to choose for navigation, also add
>>> a bit of color to the links to make them screen
>>> friendly.
>>
>> Well, it may not be obvious, but hyperlinks have been there in the TOC.
>> You mean you want them colored blue?
>>
> 
> Yes, but they've been a bit hidden (largely bold text between section headings
> and references, I have to move my mouse to get know if it is a hyperlink)
> 
>> For TOC, they may be OK.
>>
>> But I'm afraid that to color all the hyperlinks in the whole textbook
>> could be too aggressive, as can be seen for example in Section 5.2.4
>> (below Listing 5.5). Frequent colored line numbers can look too
>> fancy/noisy for some people.
>>
> 
> I see what you mean, how about a gentler color like gray, but I am not 100%
> sure how that would look in print.

"DarkBlue" via svgnames option looks less fancy.
How it looks depends on the display/printer setting and individual color sense,
though.

> 
>> Does adding an experimental target to make hyperlinks colored work with
>> you (similar to -1csf, -msnt, and the like)? If so, which layout do you
>> prefer, 1c or 2c?
>>
> I prefer 1c, but I think the print will always be 2c for saving paper.
> But please
> bear in mind, adding too many targets makes it confusing when Paul tries
> to release this to the world, no?

Actually speaking, I was the one who added all those experimental targets.

As 1c is mainly for PDF viewers, I think coloring hyperlinks in 1c layout
should be acceptable. It should also help those who view on tablets (without
mice). 2c layouts won't be affected by the change.

So, I'll prepare a patch to do it. Please give me a short while.

>                                   I am OK skipping colors to keep the PDF
> uniform
> 
>>>
>>> Also add synctex=-1 to prevent pdf readers like
>>> evince from complaining to the pdflatex command
>>> line
>>
>> As for SyncTeX support, how about the approach in the patch
>> below?
>>
> 
> Yep that work!

Nice!

I'll submit a v2 of the patch with a proper change log to clarify that
you are the original author. I don't think the" Reported-by:" tag is
good enough. To be honest, I had no idea of the -synctex option before.

        Thanks, Akira

> 
> Balbir Singh.
> 
>>         Thanks, Akira
>>
>>>
>>> Signed-off-by: Balbir singh <bsingharora@gmail.com>
>>> ---

[...]
