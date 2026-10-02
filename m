Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497873081A2
	for <perfbook@vger.kernel.org>; Fri,  2 Oct 2026 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924863; cv=pass; b=ixC8Gr/L7iK/jqTu83IBcm1FJ2AAsnSER3BoRtJUPaT/4ehxoqT1PQUZSKoM6ZuFh619nNyrTDCQmdBdehI7TJBmSwWZj7w51G3Xew7vRSbawWCnw7s77zVpfOA21cCzR7qppVrlVCAEDC5Zt8VX3xnb2EMU6PIbf44HWrficlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924863; c=relaxed/simple;
	bh=6JjttdgqnvznLdeRXau/NGKvwmxfpnrWwzk9I2BrZHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OuClLjP4sK4MsgZrX4ks+eyskZJ2so/CTkt/FBKFFIH44aJv7b1QeaZzXj9lCbxuh7UBQecUUuSfrduRDk7OL0FeTk9JsBhL0qTYPidYbAEGk24o4dG7VIrAOHbJmj1iMHTiVmERenFTPudtUwA/jk7ow84Ohz63mn2XrAg04iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXLCqGgh; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXLCqGgh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso34509445e9.3
        for <perfbook@vger.kernel.org>; Fri, 02 Oct 2026 00:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924860; cv=none;
        d=google.com; s=arc-20260327;
        b=Pfho8SWTogR5xA7v60QH7Jc5NrGjSXS3eRg15Fz8pb53hGW0InYm8wTsiUG5DTGGfs
         GWBxJoewro+sQcdZja+f9/oczvsPHTC4xFGlnxyOTvDJ1KLH0gvIoGhiRrNZYw7H9cAL
         Ag1+dwsC+dh57KSaMwWKGJK+bT2wh0jmwBmOg/Mx+t4iNFL3X71XkpPt6lOrM+tJ8SPT
         o6SJXuY5tnc262X1J32gficPlqGt0X2RH611YI2IP0wZ/akh/magQERxhxwCGOxk47XK
         pz1HCeNPPmdL99MH0D/fPgQdE+yR/4t1AXK69hs++4uR28V7k94MIt3QwBZOWY51ryKc
         lAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5zCHJHssWL9fed7HEln2UrA9mgZ/ojP+SHfkITcbys4=;
        fh=okygWNZTFyb1ZBuT1snUldHOOCnYGA98/lGw8RP626A=;
        b=s0ZB/69u46XkPCjR54IhCXZPstVHBtztRRnOwDrUjZboCgoHYh/9M2ok24NIz8Dcki
         D0b61tSCpxZPrqo7g/hIonmvERqbZD0x/x3bio2rcbeHnwgOKhtsbNGlXwNe/rpxGBSi
         k6aDJpW3WCLBx4GLf9WWCqNKc5fV7C7RtySITI0WH4V/4fJ2pQwFVELx/gd9iTbvORqq
         SkVDwt11YRUH2RcJdeBMAqSjARMIItH/p4AthY+ssH5WIOj6Arvz9jTlnjKlLkz49BXe
         udQP4syRxKxsrlnHOlMhwnEi2I79DDxZfsNk/iee0HHEFvoW+FWWiroxB6MmlNbUhr8L
         sngQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924860; x=1791529660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5zCHJHssWL9fed7HEln2UrA9mgZ/ojP+SHfkITcbys4=;
        b=XXLCqGghJWIlCFCoovuFLEis4tnXO2gL2c1lpIrrTrtLBSgiC2lrHfOWD1ffrqc7T2
         AMJFls6TuqWBFckbUvIEpJPDL5QldArFiDY3aHsdI3VTsN7xGFhKKPtgd3vV9mTXyxfW
         6AbEYN+nZpLx7fQ8wHe7PfcChOdNhFKrClGsvlMokEKrGH78trIYgsq7OieoezN9ijEu
         y4PvuawLA3hqGUv5FZv7oukeEcvoQD57ETOezhNIIGc32ibrc22Rx2xsrnYkQYkoNRnx
         FykjcNEDTJ6I8xuXZQPQvwMTRBBA0ausSSnKEtLdKFyGnanwm+mUMRg6zTg0jSq8tw4Z
         0FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924860; x=1791529660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zCHJHssWL9fed7HEln2UrA9mgZ/ojP+SHfkITcbys4=;
        b=WhtF+4QzeDqPpNJwBdLZAMWPejSqCp09YpYhBtGEqwxrGyGGl5fvfvZk4lM1JyBwiX
         Dm0rhYVdzS7c79Q+YPbKczl+ElEPrWabXA1PJxTPTdH7BY97rOhj3pjwbvhudHUlFfW8
         5IiZvLOtuwYrTB+haFTLwH3n52bApO8mapPQ059AotNX9ya6Au86yOA0RT+ClgyzBIaP
         P4FGfER22wVF/9NBjuyEPKez6FvhQpZ61P6lw5K2mu58e2Nwy58mmPPhgewdaYc8eA26
         F3Uhn3n+iK9BkvSnfA0ZgWLqIib3BT3HQfQsVf7RwKsx0eynfNxPkzsY52fDMWO3oWks
         uvTA==
X-Gm-Message-State: AFuF++mYXGr0i3DzCYQZn0pbGM7wpQSI98wPhUh0bJbh5o+HnwF98mNc
	FUouZbTwL0sPC1YOTARsKsNrmQNqR5EPbj0bygXOcme7cTRUOVZ5tszIg04pd+VDYyJTQWqOCCo
	sEREbQmuIkNrIdcmFQFszeOCd7vaDyhc=
X-Gm-Gg: AYBFou31K3xAkvLe1beqYNBdi8BzfN3Sy1UdjZoYvzOWpJQuf4YCxwGxyoIr2qPi8Rg
	G8dmc9gxdQZwlgTKmGP599x39/f2Y/9E7Y/Qg7oYYZv8IL6tnFITo2t8rUeAY75Xa55K1Fi4bWH
	8OnId5V30I/tPf9nXkNjX4uXWawiqmF+U1TZFtHymyqMa9GRqBT8wuUHZIdHxnqDybtvq2h2NaL
	FFz1zO6+F9P2Z0aOZXKZkVqyj7n7+iYbzR80KKiFFF+VhFeYjB+f/CzxCtIb380wnAb96AAv25u
	aULqx58n6L0FIZZQmA0fpzXWLfff++9Y/HPgPVr3DB4rUxql0t9FtmsmwnKQZFwAkV1+tyLigGZ
	8QaA/pLquLLzLQzZxKUmFeTG/
X-Received: by 2002:a05:600c:3b01:b0:49f:fe7e:dc61 with SMTP id
 5b1f17b1804b1-4a02745924bmr33011815e9.0.1790924859561; Fri, 02 Oct 2026
 00:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819032432.862450-1-kunwu.chan@linux.dev> <0657a451-57fc-4e67-8bdd-43f3e1b3a7ff@paulmck-laptop>
In-Reply-To: <0657a451-57fc-4e67-8bdd-43f3e1b3a7ff@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 2 Oct 2026 15:07:28 +0800
X-Gm-Features: AclHuK9hXZgmg5mRFub2jzEeYAVRllzEa2VTUlJrU07hjpX_gY_o1Ob2YQBaHhQ
Message-ID: <CAN_Opa82ibPCxNfGJdZPeB67UrRz-324Tjd-wcKtAZvRJWy9vA@mail.gmail.com>
Subject: Re: [PATCH] datastruct/hash: Simplify hashtorture initial insertion
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 7:17=E2=80=AFAM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Wed, Aug 19, 2026 at 11:24:32AM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Commit 1314f0a0 ("datastruct/hash: Speed up hashtorture initial
> > insertions") replaced random element placement with a linear scan
> > guarded by:
> >
> >         if (elperupdater / 2 - j <=3D elperupdater - i || random() % 2)
> >
> > The left disjunct is always true along the loop execution.  The loop
> > maintains the invariant i =3D=3D j, starting from i =3D=3D j =3D=3D 0. =
 The guard
> > therefore reduces to elperupdater / 2 <=3D elperupdater, and each force=
d
> > insertion increments both i and j.  Thus random() % 2 is never
> > evaluated, and the loop has inserted the first elperupdater / 2
> > elements consecutively since 2020.
> >
> > Simplify both perftest_updater_init() and zoo_updater_init() to plain
> > for loops, drop the unused counter j and random.h include, and update
> > the comment to describe the actual deterministic behavior.
> >
> > This does not change the test behavior exercised since 2020.  The
> > randomized initial population was the only stochastic element in this
> > initialization path, while the concurrent update loop is a deterministi=
c
> > round-robin over each updater's elements.  The perfbook description of
> > hashtorture ("RCU-Protected Hash Table Validation") lists invariant
> > verification, concurrent-corruption detection, resize correctness,
> > and performance-data collection as the documented coverage; none is
> > described as depending on the initial key distribution.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Queued and pushed, thank you!!!  And please accept my apologies for the
> delay, hopefully better late than never.

No worries at all, Paul! I just happened to notice this while looking
through the code.
Thanks for picking it up, and better late than never indeed! :-)

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > ---
> >  CodeSamples/datastruct/hash/hashtorture.h | 41 ++++++++---------------
> >  1 file changed, 14 insertions(+), 27 deletions(-)
> >
> > diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/da=
tastruct/hash/hashtorture.h
> > index 4bd8e247..4fbb7623 100644
> > --- a/CodeSamples/datastruct/hash/hashtorture.h
> > +++ b/CodeSamples/datastruct/hash/hashtorture.h
> > @@ -815,27 +815,20 @@ void *perftest_reader(void *arg)
> >       return NULL;
> >  }
> >
> > -/* Pre-load specified updater's portion of hash table. */
> > +/* Pre-load the first half of this updater's elements into the hash ta=
ble. */
> >  void perftest_updater_init(int mylowkey, struct testhe *thep)
> >  {
> >       long i;
> > -     long j;
> >
> > -     i =3D j =3D 0;
> > -     while (j < elperupdater / 2) {
> > +     for (i =3D 0; i < elperupdater / 2; i++) {
> >               thep[i].data =3D i + mylowkey;
> >               thep[i].in_table =3D 0;
> > -             if (elperupdater / 2 - j <=3D elperupdater - i || random(=
) % 2) {
> > -                     perftest_add(&thep[i]);
> > -                     BUG_ON(!perftest_lookup(thep[i].data));
> > -                     j++;
> > -             }
> > -             i++;
> > +             perftest_add(&thep[i]);
> > +             BUG_ON(!perftest_lookup(thep[i].data));
> >       }
> > -     while (i < elperupdater) {
> > +     for (i =3D elperupdater / 2; i < elperupdater; i++) {
> >               thep[i].data =3D i + mylowkey;
> >               thep[i].in_table =3D 0;
> > -             i++;
> >       }
> >  }
> >
> > @@ -1132,26 +1125,20 @@ void *zoo_reader(void *arg)
> >       return NULL;
> >  }
> >
> > -/* Pre-load specified updater's portion of hash table. */
> > +/* Pre-load the first half of this updater's elements into the hash ta=
ble. */
> >  void zoo_updater_init(int mylowkey, struct zoo_he **zheplist)
> >  {
> >       long i;
> > -     long j;
> >       struct zoo_he *zhep;
> >
> > -     i =3D j =3D 0;
> > -     while (j < elperupdater / 2) {
> > -             if (elperupdater / 2 - j <=3D elperupdater - i || random(=
) % 2) {
> > -                     zhep =3D malloc(sizeof(*zhep));
> > -                     BUG_ON(!zhep);
> > -                     strcpy(zhep->name,
> > -                            &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
> > -                     zoo_add(zhep);
> > -                     zheplist[i] =3D zhep;
> > -                     BUG_ON(!zoo_lookup(zhep->name));
> > -                     j++;
> > -             }
> > -             i++;
> > +     for (i =3D 0; i < elperupdater / 2; i++) {
> > +             zhep =3D malloc(sizeof(*zhep));
> > +             BUG_ON(!zhep);
> > +             strcpy(zhep->name,
> > +                    &zoo_names[ZOO_NAMELEN * (i + mylowkey)]);
> > +             zoo_add(zhep);
> > +             zheplist[i] =3D zhep;
> > +             BUG_ON(!zoo_lookup(zhep->name));
> >       }
> >  }
> >
> > --
> > 2.43.0
> >
