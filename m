Return-Path: <SRS0=oPGg=SR=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auBhwpQEI+aXSvUIg+UxTsQM2vgjsB/qltJaxkV3X3M=;
        b=S/qosiSBIQeM2xAjkFKg3W0QkLczat07xcFe29ARcTLfo+RKJPEaemmDs9IRnnWnyL
         KXdFl2Um3W43J/UMc6nUWvQ4wzYJ2x0deXgmLAuy6iaqQVppLyBhrqSulNFvgygaNnUM
         beQX3I6UfKP8LTHkHSpIt2UkT3oEX7KScHTuTiRH++u+B0byPcG3V0oJltKCiyWlfdo4
         2DEvy0rTxI+sbqSmWG1dxvOdyP2Xfp1G8qzuVhig/CSbVgmUJfeC+fAYns1tJCFidGyG
         QcyC9gbn7EkIMxC59yysLOgEdP5nZbJ8jKZdGvby28gUQQbl085dM/B4IT4KB89eYnqE
         b7zg==
MIME-Version: 1.0
References: <CAABZP2zB4H-00wrLJPPS5CrVW-D1W_bgiECWnJRw7FvnYVrsVQ@mail.gmail.com>
 <20220202044857.GJ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220202044857.GJ4285@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 2 Feb 2022 14:12:08 +0800
Message-ID: <CAABZP2xPf=Mr5wwUmWs69TN+vJqiVwmpjgda1a1eC3tMMgXgww@mail.gmail.com>
Subject: Re: perfbook: a possible typo report
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Yang Lu <luyang.co@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Thank Paul for revising the paragraph for me!

On Wed, Feb 2, 2022 at 12:48 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Feb 02, 2022 at 12:11:14PM +0800, Zhouyi Zhou wrote:
> > Hi Paul and Akira
> >
> > I found a possible typo in section 17.2.1,
> > "This section therefore critiques transactional memory's ability to so
> > interact,"
> >
> > I tried to improve my English everyday, but I still can't tell whether
> > "so interact" is good or not good.
> >
> > Thanks for your time
> > Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> Here is that paragraph:
>
>         Whether we believe that input and output are "real programming"
>         or not, the fact is that for most computer systems, interaction
>         with the outside world is a first-class requirement. This
>         section therefore critiques transactional memory's ability
>         to so interact, whether via I/O operations, time delays, or
>         persistent storage.
>
> The "so interact" refers back to the "interaction with the outside world".
> But I agree that this can be unclear.
>
> The last sentence is thus shorthand for:
>
>         This section therefore critiques transactional memory's ability
>         to interact in this way with the outside world, whether via I/O
>         operations, time delays, or persistent storage.
>
> But this feels a bit repetitive.
>
> Maybe something like this?
>
>         Whether or not we believe that input and output are "real
>         programming", the fact is that software absolutely must deal with
>         the outside world.  This section therefore critiques transactional
>         memory's outside-world capabilities, focusing on I/O operations,
>         time delays, and persistent storage.
I read it twice, and the revised paragraph looks fantastic to me!

Thanks again
Zhouyi
>
> Thoughts?
>
>                                                         Thanx, Paul
