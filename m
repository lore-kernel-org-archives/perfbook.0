Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;        bh=ITX8TSB01guYPUaoC0wi6dsavhVZNiLC7uX1pCLAVwI=;
 b=XJKFWoVxQ1XrQ+cmW+/mnqVqIC51zwGyxVt9KVdHl78TNskaebK96bZBbwQZl09bkD
 bJ71vi9GI9vJbXm5V0M1X67HWDOIN8Mgxoun4MkF8owg7HtH36C6Bg4Ol5FmbHp4Vhl2
 wDs/JZz/uziL/spAT6cSilnSHDPA0XhcIYtGFBtWkOUDX749QmRRxcrKg5oUjkEees0J
 WFbRJrxSau5PIvyPClAnpNmW8BZY0BMIJA1h4JnPEgdHzVOddI8qArxgA3K3OplZxDLV
 l2n7fLljF+v1zbc5ez8v7aqXUBP7+XkSu0tVz+A9PrPA9+yFMY44fyT4pu7goY20hJc5
 5QHg==
MIME-Version: 1.0
In-Reply-To: <20160118031056.GX3818@linux.vnet.ibm.com>
References: 
 <CAEjAshoeN2zOd=OEH_DBwdXG7uBDQkfWaeQr+8mTyoObF_onqg@mail.gmail.com>
 <CAEjAshqMr-jMKx92UTAt2JdZd_F0Swmrwedquy4f+hRKX95hww@mail.gmail.com>
 <20160118031056.GX3818@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Mon, 18 Jan 2016 12:15:24 +0900
Message-ID: 
 <CAEjAshq0QM5YLKB+iQYAZUVPVKNixCVgx129Ke8ozmY2BgWK1w@mail.gmail.com>
Subject: Re: I am translating the book in Korean
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Jan 18, 2016 at 12:10 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Mon, Jan 18, 2016 at 10:21:27AM +0900, SeongJae Park wrote:
>> Hi Paul,
>>
>> I am waiting for your reply yet. Is there anything wrong?
>
> Only that I seem to have not gotten your email.
>
> I see your git archive, which does look to have the howto chapter
> translated.
>
> So how about the following patch to FAQ.txt?

Looks great. I believe the change will motivate me for faster progress ;)


Thanks,
SeongJae Park

>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit edbfcdee046026d3f98592c411a20219b96c8e50
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sun Jan 17 19:09:51 2016 -0800
>
>     Add Korean translation to FAQ.txt
>
>     Reported-by: SeongJae Park <sj38.park@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/FAQ.txt b/FAQ.txt
> index 9af9cc0ee3cc..80fe7f282f85 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -166,6 +166,10 @@
>
>                 https://sites.google.com/site/kandamotohiro/perfbook
>
> +               SeongJae Park has started work on a Korean translation:
> +
> +               https://github.com/sjp38/perfbook-ko_KR
> +
>  10.    I am working on a translation.  What do I need to do to get my
>         name of the list in #9 above?
>
>

