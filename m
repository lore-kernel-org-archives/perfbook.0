Return-Path: <SRS0=PC34=RQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FuSPz2hq5Ee2NipcclhGO3kf4P36reNMOxmT52B+Ql8=;
        b=iHTgSa4WEqPnBkp1qW2isjE5aO3IU2CbpkjLos6/MjYjbJGDjf0qczn0cwI+QKOfC1
         RfZfb/NI4HZ5GLOM3cf/dWDDs/rBdEoOx13Xn0KLzOiW92xYzyB4KmEmwCUlPsRsVFzg
         SUoLDUzH2YqyyCE+lUJpw4VItii93d5ub4OkLkFDYgOMlFT1G+lIlBdbu7b+0PRFfWp+
         apYpHcwNRR1xn8RUFkd2b//fC7bta6K5JXW7BreRfvqs6Uq7ByMdXpMBUY76f7o3sA2p
         4p839ZWmoyi3AJtWiyxC/4g2lf5BbMCbCVvGMWbLjtJeEKvus6RMr/j2L40gGYs93udI
         uE5g==
Subject: Re: [PATCH -perfbook] defer: Retouch SVG files for browser
 compatibility (2nd attempt)
References: <f4bf6a67-ff75-51d3-1253-a17042439ade@gmail.com>
 <20211231173756.GG4109570@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6525231c-a11f-0085-4b28-bbcd8701ab3a@gmail.com>
Date: Sat, 1 Jan 2022 08:48:34 +0900
MIME-Version: 1.0
In-Reply-To: <20211231173756.GG4109570@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 31 Dec 2021 09:37:56 -0800, Paul E. McKenney wrote:
> On Fri, Dec 31, 2021 at 11:29:21AM +0900, Akira Yokosawa wrote:
>> In <text> elements which are misplaced when viewed in a browser,
>> there are "transform" directives of the form:
>>
>>     transform="scale(-1)"
>>
>> (indicating rotation of 180 degrees), and attributes of:
>>
>>     writing-mode:tb-rl
>>
>> (top to bottom, right to left: Normally used in vertical text in
>> Asian languages.  "lr-tb" is the normal choice in English.)
>>
>> By manually removing those transform directives and replacing
>> "tb-rl" with "lr-tb" by a text editor; then ungrouping, rotating,
>> and moving those text elements by Inkscape 1.1.1; browser-compatible
>> SVGs have been obtained.
>>
>> Regrouping of edited text elements have been done as a final stage.
> 
> Looks good, thank you!  Queued, and will push soon.
> 
> I grouped the "Delete-Only List" box, which might well have been
> ungrouped to start with.

Ah, I missed that one.

>                           This also serves as a test of Inkskcape> v1.1 modifying a drawing produced by Inkscape v1.1.1.  ;-)

Nice!

> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> I've not figured out what operations corrupted those text elements in
>> RCUspacetime.svg.
>> So take this fix as a "happens to work" kind of thing.
>>
>> Do you have any clue as to why those text elements have 180 degree
>> rotation and vertical writing mode?
> 
> My best guess is that in the process of copying old figures to make
> new figures, I took some 90-degree rotated text and rotated it back.
> That -should- result in zero-degree rotation, but if the two verions
> of Inkscape used different pivot point for rotation, it would not have
> been possible to simply cancel the rotations, at least without quite a
> bit more math than I would expect to be applied.

I'm still wondering where that "tb-rl" mode come from.

> 
>> I guess you copied such a text element to RCUusecases.svg and edited
>> and copied it in Inkscape.  So I suspect RCUusecases.svg was corrupted
>> from the very beginning.
> 
> That is my guess.
> 
>> After this update, you should be able to edit both SVGs by Inkscape
>> as you'd like, I suppose.
> 
> Looks good at the moment, but I am curious as to what your version
> of Inkscape thinks.  ;-)

Will see when you push your grouping.

> 
> And Happy New Year!!!

Happy New Year!

        Thanks, Akira
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>>  defer/RCUspacetime.svg |  88 +++--
>>  defer/RCUusecases.svg  | 707 ++++++++++++++++++++---------------------
>>  2 files changed, 378 insertions(+), 417 deletions(-)
>>
[...]
