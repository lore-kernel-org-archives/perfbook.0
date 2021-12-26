Return-Path: <SRS0=mfu+=RL=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30Mqv7FRzR/ZD+YeP+IxcFsPpGEClq8+6VMnOo4XJYs=;
        b=PJZcp9Fd+ueJJ/8rNxjvXOMNRKKoascNUg9sTZDWT1jIxyfL2jHlVCNdH2h0oEFdps
         281Bsq4OeHpH4o3s+lfHDGwyMYzOij5ZmU02MvcAYqK/X1mhV0/9+GwckxiBUQu67o3g
         tA8vEfX1oA/G5LKVgrxYoGcMX5luClJm1/QgtKirANR4tveV4wPD6qwVge/uzeP347NM
         huIIfRHD04qCC/CKqydokCWyCGFRhFkGAl4GMH8o4HRuTSealXtXoD75wjPdC46I9sTx
         iucPYyKUl+TkEPSlPXdchtg6XEF9Jg0R+pECsw8zXhTWH5UUnJ5EoBjaSiu9zffMkpUL
         jTtg==
MIME-Version: 1.0
References: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
 <a120d22c-50e4-c74d-8968-81744ad99c2e@gmail.com> <20211225080347.GS4109570@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211225080347.GS4109570@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Sun, 26 Dec 2021 11:32:28 -0500
Message-ID: <CAJbg=FX6ePhvs9Vx0fy=WQkyT8TAa-WWFprDzwDzzRrMJc3dQg@mail.gmail.com>
Subject: Re: Draft blog post on v2021.12.21a release of perfbook
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, sj38.park@gmail.com, bsingharora@gmail.com, shiyn.lin@gmail.com, luyang.co@gmail.com, Zhouyi Zhou <zhouzhouyi@gmail.com>, pat.github@tullmann.org
List-ID: <perfbook.vger.kernel.org>

FYI, the ebook-sized PDF renders perfectly on my Kobo. Kudos to
everyone who contributed to this edition.

--Elad

On Sat, 25 Dec 2021 at 03:03, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sat, Dec 25, 2021 at 09:40:01AM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> >
> > On Fri, 24 Dec 2021 12:53:09 -0800, Paul E. McKenney wrote:
> > > Hello!
> > >
> > > I have drafted a blog post for the new release here:
> > > https://paulmck.livejournal.com/66892.html
> > >
> > > I have also added the epub build to the landing pages:
> > > https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
> >
> > Well, it's not epub as (ebook-size PDF) != EPUB.
>
> Good catch!  I changed from "epub format" to "ebook-sized PDF".
>
> Better?
>
> > Also, there remains the old remark on "horrible results" of such builds.
> > I think there are still rooms to improve, but it looks mostly reasonable now.
>
> I had forgotten about that, and just now reworked it.  Thank you for
> the reminder, and please let me know if additional adjustments would
> be helpful.
>
>                                                         Thanx, Paul
>
> >         Thanks, Akira
> >
> > >
> > > Finally, I updated the Arxiv version at https://arxiv.org/abs/1701.00854.
> > > This is in "submitted" state, and may take a day or three to become visible.
> > >
> > > In the meantime, please let me know of any errors or omissions!
> > >
> > > I will post to my personal social media in a few days.
> > >
> > >                                                     Thanx, Paul
> > >
