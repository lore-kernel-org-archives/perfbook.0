Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhLVST2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 22 Dec 2021 13:19:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAA8C061574
        for <perfbook@vger.kernel.org>; Wed, 22 Dec 2021 10:19:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E12E361BC2
        for <perfbook@vger.kernel.org>; Wed, 22 Dec 2021 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640197167;
        bh=f0XTBSw6/9Nfooe3DFVYaU4vPSybUHvXa5CJmX8zSP4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WrYKiN/BN8lxcunQ4IWgwRSsxD+Uzc61zVJspzvU5zorli8IUU3LU/TDtiL9AbE4h
         eXl5ble3AYvAZgb5CgzwRuxIBTJ8NKsUBgN3OIStcHVvja2CKChZPHVaei3qsHcE6f
         8pNP6oJ/wOKRUJWlY8TSpxNwo7IAUDOPjNemj8UDmNxhGLs6Z7rCCL9KTThMuEASOj
         DDsG4AEWFO+TWTOZMd1yZQJfB1pzwzKtORY7+z+sD70W3DlJyo4QUsFPd31qucNjIF
         98czFCXLO8SSVeBQQ25nVuzq8MhZMldqwHG2/RC3P6A2/40NUIRPWe+PHoI3VMfFS6
         3E/Gk6nUHZf7Q==
Date: Wed, 22 Dec 2021 10:19:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Message-ID: <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
 <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
 <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
 <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Wed, Dec 22, 2021 at 11:35:02PM +0900, Akira Yokosawa wrote:
> Hi,
>=20
> On Wed, 22 Dec 2021 07:15:54 -0500, Elad Lahav wrote:
> > Hi Akira,
> >=20
> >> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
> >> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".
> >=20
> > I don't believe it is. I think you can infer that from reading sections=
 9.5
> > and chapter 15, but it is never made explicit.
>=20
> I agree it is not explicit.
>=20
> >=20
> > Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain a
> > pointer, but it doesn't go very deep into how that's implemented. You w=
ould
> > think that the writer's use of store-release semantics would necessitate
> > the reader's use of load-acquire semantics, but the discussion here, the
> > previous examples, and a quick inspection of how rcu_dereference() is
> > implemented, suggest that a READ_ONCE() is sufficient (or some less
> > Linux-kernel-specific equivalent).
> >=20
> > If I am a naive reader (and a lazy one, who haven't read chapter 15 and=
 made
> > the necessary connection), I could write something like:
> >=20
> > =A0=A0=A0 struct foo_s {
> > =A0=A0=A0=A0=A0=A0=A0 int a;
> > =A0=A0=A0 } foo;
> > =A0=A0=A0 int b;
> > =A0=A0=A0 struct foo_s *g_foop =3D &foo;
> >=20
> > =A0=A0=A0 // Reader
> > =A0=A0=A0 rcu_read_lock();
> > =A0=A0=A0 struct foo *l_foop =3D rcu_dereference(g_foop);
> > =A0=A0=A0 use(l_foop->a);
> > =A0=A0=A0 use(b);
> > =A0=A0=A0 rcu_read_unlock();
> >=20
> > =A0=A0=A0 // Writer
> > =A0=A0=A0 struct foo *l_foop =3D malloc(sizeof(struct foo));
> > =A0=A0=A0 l_foop->a =3D 1;
> > =A0=A0=A0 b =3D 2;
> > =A0=A0=A0 // Release semantics ensure previous stores are observed
> > =A0=A0=A0 rcu_assign_pointer(g_foop, l_foop);
> >=20
> > But since b has no address dependency to g_foop and since neither
> > rcu_read_lock() nor rcu_dereference() impose acquire semantics, then
> > the reader may not observe the new value of b.
>=20
> No, it may not.
> So what you want is the mention of "address dependency" somewhere in
> Section 9.5.2.1?
>=20
> >=20
> > Again, I may be missing something, but this seems to be a major point
> > that needs to be explained and emphasized.
>=20
> I guess Paul is intentionally avoiding discussions on memory ordering
> here in Section 9.5.
>=20
> Such a discussion would easily frighten naive readers...
>=20
> Anyway, I guess Paul would have some good compromise to satisfy you.=20

Actually, I am going to ask Elad to propose the location and wording of an
addition to Section 9.5 covering this, so that we can discuss and refine
it.  This addition might be a new paragraph, a footnote, a quick quiz,
a citation, or what have you.  And the refining might switch back and
forth among these options a few times.  But we do have to start somewhere.

I am thinking in terms of this going in after the release that I was
naively planning to do yesterday.  (The objective universe had other
ideas.)

> >> BTW, I couldn't figure out what you meant by "the Spanish
> >> Acquisition"...
> > It's a reference to an old Monty Python skit. Apologies for the silly p=
un...
>=20
> Ah, now I guess I see the pun of "acquire" and "acquisition".  ;-)

And here I was hoping that Elad was purchasing a house in Barcelona
or some such.  ;-)

(Sorry, couldn't resist!)

							Thanx, Paul
