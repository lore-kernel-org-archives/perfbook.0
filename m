Return-Path: <SRS0=nsJR=GG=gmail.com=danny.nitzan@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCw/80LouXds6aTLgar5aQ3/iA4JQK7Ndp6Mvo4YRUk=;
        b=PPMnrz8nzGRHgM0Bvcs9gnWYJIyZHojv0YL/Le6g4Orij3O+tIO3z1wALQ+qXDdgn3
         SwNZ4/ZnAznSDd0KYItOUyZtH9XLjgk0EmnoXtrUnd5L13QbC9//P+TZ0pSjr0BiYHM+
         YYBd6Smfump4MwWG+ULEwhpHogQCxXfEhgjTa/SLKom44S8p6SCulWjN0BTmfNp2SpXu
         vFyiL7Eiyy2myX+CZzQ/CfCwBY7KlNoi9JAhCNs6frHs0LN8NfXg34dpJWEPZdjYXCME
         eU3t2A8kZFoIW29wdqQMt3rw/EAuqvBgUMCX1Bu9B6lZjtGMi++y6UeziMZ1GYGBGOWa
         4g4g==
MIME-Version: 1.0
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
In-Reply-To: <20210103035250.GE12032@paulmck-ThinkPad-P72>
From: Daniel Nitzan <danny.nitzan@gmail.com>
Date: Sun, 3 Jan 2021 09:06:31 +0200
Message-ID: <CAApSCJY4CTJDEm7PbaGVg-Ac7Uy7j6Ux5TR9d=2sWDA_fbxJ6Q@mail.gmail.com>
Subject: Re: Request for clarification on Alpha reordering
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul!

On Sun, Jan 3, 2021 at 5:52 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sun, Jan 03, 2021 at 12:04:24AM +0200, Daniel Nitzan wrote:
> > In 15.5.1 (Alpha) - In regard to the following statement: "Yes, this
> > does mean that Alpha can in effect fetch the data pointed to before it
> > fetches the pointer itself, strange but true."
> > I'd appreciate it if someone could clarify what this means. I don't
> > understand this statement in light of the actual data-dependent
> > reordering presented in this section, i.e. the pointer itself is
> > fetched, points to the correct location in memory, but the data is
> > stale.
>
> Yes, your last statement is equivalent.  Either way, the reading CPU sees
> the new value of the pointer and the old value of the pointed-to data.
> You can look at it either as counter-intuitive reordering (as I did)
> or as counter-intuitive stale data (as you did).
>
> The key point is that these values are not in a single location, but
> are instead replicated across the CPUs' caches.  Stores are therefore
> not atomic unless the hardware goes to a lot of trouble to make them
> appear to be atomic.
>
>                                                         Thanx, Paul
