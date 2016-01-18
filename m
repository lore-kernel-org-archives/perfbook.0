Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;        bh=oZXuEGgBKU3N6cA2av2qRdcbm/OY2CF5vn7klfdZj/s=;
 b=fnt3hiamirftz3EplqFMUdBqssGzI3ZWtozCSPDaLuRUdwN1Fa9JDK5HyjevQDusVA
 jPgAZhWqO26ceamD52xtcYemc/C30a0yDhKStxHqV7N4C0JYtqZ093lKlSEjeKAK6P7H
 /X8+tNGAJOBJo631ZMMfaKpGyJfzUyOpp6XwPArch0IvTPxM2hezK+tv+hrCoRLwuswQ
 9CQ3e7o3w5JbnEu4HxhUWXPimlm6cT+o+EpZ3Q3ifXWR4BlZNaDBbCtrMBkZ2vhMFzpF
 TPsS4SDNldASQeOcd1UXTW0zWUyFDJPAyQwQ19X2FXDPyxr5zrRfdxEHHKKNKHTQHfk1
 qk9A==
MIME-Version: 1.0
In-Reply-To: <20160118040910.GY3818@linux.vnet.ibm.com>
References: 
 <CAEjAshoeN2zOd=OEH_DBwdXG7uBDQkfWaeQr+8mTyoObF_onqg@mail.gmail.com>
 <CAEjAshqMr-jMKx92UTAt2JdZd_F0Swmrwedquy4f+hRKX95hww@mail.gmail.com>
 <20160118031056.GX3818@linux.vnet.ibm.com>
 <CAEjAshq0QM5YLKB+iQYAZUVPVKNixCVgx129Ke8ozmY2BgWK1w@mail.gmail.com>
 <20160118040910.GY3818@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Mon, 18 Jan 2016 13:19:21 +0900
Message-ID: 
 <CAEjAshqa8OM9t3A2-Z=s0tkwDcoj-ewFkym8_izDGuh5WfMXaw@mail.gmail.com>
Subject: Re: I am translating the book in Korean
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Jan 18, 2016 at 1:09 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Mon, Jan 18, 2016 at 12:15:24PM +0900, SeongJae Park wrote:
>> On Mon, Jan 18, 2016 at 12:10 PM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Mon, Jan 18, 2016 at 10:21:27AM +0900, SeongJae Park wrote:
>> >> Hi Paul,
>> >>
>> >> I am waiting for your reply yet. Is there anything wrong?
>> >
>> > Only that I seem to have not gotten your email.
>> >
>> > I see your git archive, which does look to have the howto chapter
>> > translated.
>> >
>> > So how about the following patch to FAQ.txt?
>>
>> Looks great. I believe the change will motivate me for faster progress ;)
>
> Very good, applied and pushed!

Pulled and checked. Thank you!


Thanks,
SeongJae Park.

>
>                                                         Thanx, Paul
>
>> Thanks,
>> SeongJae Park
>>
>> >
>> >                                                         Thanx, Paul
>> >
>> > ------------------------------------------------------------------------
>> >
>> > commit edbfcdee046026d3f98592c411a20219b96c8e50
>> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> > Date:   Sun Jan 17 19:09:51 2016 -0800
>> >
>> >     Add Korean translation to FAQ.txt
>> >
>> >     Reported-by: SeongJae Park <sj38.park@gmail.com>
>> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> >
>> > diff --git a/FAQ.txt b/FAQ.txt
>> > index 9af9cc0ee3cc..80fe7f282f85 100644
>> > --- a/FAQ.txt
>> > +++ b/FAQ.txt
>> > @@ -166,6 +166,10 @@
>> >
>> >                 https://sites.google.com/site/kandamotohiro/perfbook
>> >
>> > +               SeongJae Park has started work on a Korean translation:
>> > +
>> > +               https://github.com/sjp38/perfbook-ko_KR
>> > +
>> >  10.    I am working on a translation.  What do I need to do to get my
>> >         name of the list in #9 above?
>> >
>> >
>>
>

