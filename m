Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6SOuv+sn+0CZ+SPODtzMNeJhDb7css87ic+1HwPYuNk=;
        b=XW8dpBMXvqfWI6bQUWUcR0SVHJPHnXoxu+NpjlgjCfDUTEohwXQMAKYM1I1+zqXqAb
         ULKSkn2otiNDlb/rYR7EyETleziypub3RLp8lbMvyf7e4r0EcHXCC7jxuUg/4RO1lr8/
         G7JSNeWP0GJZ9pdmZZVS28M+M9002ejHK5JLtpt5JPbBTe0AtdPD0m8mXGSLx0BwSktr
         wuJbkPV//bJ4/qEox1WaMUvJgCa5M84Bc6zl60o3Gpx8720X0jt9L8FhCBjMJppiB14P
         WuHa4VmSKgMz+JHoMwYixvCy3F/OaR/jVljSzJEMuFzQwQ1EapkLDjXD2po+U+mgWMh6
         NTNg==
MIME-Version: 1.0
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
 <3efe6951-cade-b721-96e3-7d41e1c39734@gmail.com> <20181105195059.GB4170@linux.ibm.com>
In-Reply-To: <20181105195059.GB4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 6 Nov 2018 14:18:58 +0800
Message-ID: <CABoNC80NzQEkWN0Fu9v94i6reva3FMw++94qcHcJFFkNs0uF4A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Updates to Chapter memorder
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Nov 6, 2018 at 3:51 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sun, Nov 04, 2018 at 09:04:28PM +0900, Akira Yokosawa wrote:
> > On 2018/11/04 19:18:37 +0800, Junchang Wang wrote:
> > > Hi Paul and Akira,
> > >
> > > I have read through the first half of Chapter memorder, and here is correction
> > > for a few typos. Please take a look.
> > >
> > > For the first patch, the last clause I modified still looks confusion to me.
> > > Currently the clause is "though only if both \co{r1} and \co{r3} both end up
> > > containing the address of \co{x}"; however, my understanding is that prior load
> > > or store would also be ordered before the store on line 16, __only if r1 ends up
> > > containing the address of x__. That is, it is not necessary to involve r2/r3. Is
> > > my understanding correct? Or did I miss anything about this in the book?
> >
> > Going back to commit 43236beadb19 ("memorder: Expand on cumulativity and
> > {other,} multicopy atomicity"), this paragraph discussed Listing 14.17
> > at the time (WWC Litmus Test With Release), which is a different litmus
> > test than the current Listing 15.17 (WRC Litmus Test With Release).
> > Still line 32 of then Listing 14.17 was an "exists" clause.
> > No wonder you can't figure out what is discussed there.
> >
> > Paul, can you look into this?
>
> Indeed, this was quite the mess!  Hopefully now fixed.  ;-)
>

Great! Thanks to both of you :-).

Cheers,
--Junchang

>                                                                 Thanx, Paul
>
> >         Thanks, Akira
> >
> > >
> > >
> > > Thanks,
> > > --Junchang
> > >
> > > Junchang Wang (2):
> > >   memorder: fix typo
> > >   memorybarriercum.svg: fix typo
> > >
> > >  memorder/memorder.tex         | 8 ++++----
> > >  memorder/memorybarriercum.svg | 2 +-
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> >
>

