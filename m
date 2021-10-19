Return-Path: <SRS0=qhXQ=PH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c9jI2a4KqaqnLhR15dTnV4Ng4BQquyWqQ8wlIaeLtNY=;
        b=K/sJ7EBxrZPFDxr5B1dg1bpYKV09EHyhj4IOanlY9aD2fjnOFMWzt1IWkjAoyoMzdo
         LHrxN4+mWJCau1U29bNwB7qFZnl0W93pw8OsSp8RJ4xm4lTEoTpSpNsJNdyN6/W1KMWf
         Ruli2FkJhMXMLWX3aRlCiWKfyW6HpfU+rs4DAoHgAvzxSzc4cY/GneS92Jza4a4kzDrw
         +21kJ0zx+xTGtFotLqf/9EIZoNKFweIj9c4FKm2WfSdMTmeakjdAJ9dVyBwmbIJA9Hw1
         KWIqHADGWriXbKLC+Y/72lAaBu8dT0EIDWTyx64/lpjZy22J4n+KKhk4fBxph8Hm6BxS
         qbKA==
Subject: Re: [PATCH -perfbook] fixsvgfonts-urwps: Add patterns for 'URW
 Gothic'
References: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
 <20211019040333.GD880162@paulmck-ThinkPad-P17-Gen-1>
 <31e09f3e-9f6d-e7e4-441c-f2b821091037@gmail.com>
 <20211019134251.GE880162@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <186b7f8c-87ef-5ce8-d080-e0b53cf91436@gmail.com>
Date: Wed, 20 Oct 2021 00:00:10 +0900
MIME-Version: 1.0
In-Reply-To: <20211019134251.GE880162@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 19 Oct 2021 06:42:51 -0700, Paul E. McKenney wrote:
> On Tue, Oct 19, 2021 at 02:42:59PM +0900, Akira Yokosawa wrote:
>> On Mon, 18 Oct 2021 21:03:33 -0700, Paul E. McKenney wrote:
>>> On Tue, Oct 19, 2021 at 11:06:41AM +0900, Akira Yokosawa wrote:
>>>> When built on Ubuntu Focal, Figure 3.9
>>>> (cartoons/r-2014-CPU-track-meet-phone-booth.pdf) does not have the
>>>> "TELE" sign.
>>>>
>>>> Ubuntu Hirsute and Fedora 34 don't have this issue, so it looks
>>>> like Ubuntu Focal lacks some configs for font-name aliases under
>>>> /etc/fonts/.
>>>>
>>>> As a workaround, add patterns taking care of "URL Gothic".
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> ---
>>>> Hi Paul,
>>>>
>>>> I'm not sure if you have the same issue on your Ubuntu 20.04,
>>>> but I noticed it and tested the workaround on the container image at
>>>> docker.io/akiyks/perfbook-build-focal:latest.
>>>
>>> I did not notice until just now.  ;-)
>>>
>>> I built a Fedora system, and it shows the "TELE" just fine even without
>>> this change.  But even with this change, I do not see the "TELE" on
>>> Ubuntu 20.04.  Quite possibly because I am missing fonts?
>>
>> Or you might have failed to remove cartoons/r-2014-CPU-track-meet-phone-booth.pdf
>> before rebuilding with this change??
> 
> Apparently, despite having done "make distclean" earlier.
> 
>> Still no "TELE"?
> 
> After explicitly removing that file, the "TELE" is back!  Thank you!

Nice!

I'll update Makefile so that affected .pdf files are rebuilt
automatically when any of fix(svg)fonts script is updated.

> 
>> What does "fc-list | grep "URW Gothic" say?
> 
> $ fc-list | grep "URW Gothic"
> /usr/share/fonts/type1/urw-base35/URWGothic-BookOblique.t1: URW Gothic:style=Book Oblique
> /usr/share/fonts/type1/urw-base35/URWGothic-DemiOblique.t1: URW Gothic:style=Demi Oblique
> /usr/share/fonts/opentype/urw-base35/URWGothic-Book.otf: URW Gothic:style=Book
> /usr/share/fonts/type1/gsfonts/a010013l.pfb: URW Gothic L:style=Book
> /usr/share/fonts/type1/gsfonts/a010015l.pfb: URW Gothic L:style=Demi
> /usr/share/fonts/type1/urw-base35/URWGothic-Book.t1: URW Gothic:style=Book
> /usr/share/fonts/opentype/urw-base35/URWGothic-Demi.otf: URW Gothic:style=Demi
> /usr/share/fonts/type1/gsfonts/a010033l.pfb: URW Gothic L:style=Book Oblique
> /usr/share/fonts/opentype/urw-base35/URWGothic-BookOblique.otf: URW Gothic:style=Book Oblique
> /usr/share/fonts/type1/gsfonts/a010035l.pfb: URW Gothic L:style=Demi Oblique
> /usr/share/fonts/type1/urw-base35/URWGothic-Demi.t1: URW Gothic:style=Demi
> /usr/share/fonts/opentype/urw-base35/URWGothic-DemiOblique.otf: URW Gothic:style=Demi Oblique
> 
> Presumably meaning that I have the needed font. ;-)

It seems that on Ubuntu Focal, those .pfb fonts under
/usr/share/fonts/type1/gsfonts/ do not work well with inkscape.
I have no idea why...

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira
>> [...]
