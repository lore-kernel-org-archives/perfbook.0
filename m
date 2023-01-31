Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjAaVpa (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 31 Jan 2023 16:45:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B929A58652
        for <perfbook@vger.kernel.org>; Tue, 31 Jan 2023 13:45:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 494A161731
        for <perfbook@vger.kernel.org>; Tue, 31 Jan 2023 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675201528;
        bh=6OqCFefMvCqZdqruRiaoun3Ztdv0QpbStIx+r3VHnhk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rzjvbB8Gi+vZw37JYrIK23WBM9RZMukRlDhnKcKHgDRtTDIpLx/BvSxVV8YX+FRCQ
         3NE7ARRXfyth23OhXo01IbxQ6PkDkD2sFWnSC12wLFwW7QQkBd861fJn8O6i9LwhrC
         ifvHY9rCoSW1gqnkK7yqmQp/Rj7k0q7qPThn0UA6X+cUtGTulB9khsiEjznApT9AbD
         hapjfrv2hCW5iEhABmFoYASSKMFP0iWy8uRUnkIckOvWEXsXOKpta8DymedZ3KF1Z/
         ydej5ganX0dzIScFin4MbeQwx1dvhQJepX5qiU/N+afOPa4VAqzwDTrrNghu7XM7fQ
         7oKCjnvyQEOOw==
Date: Tue, 31 Jan 2023 13:45:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Perfbook : Thanks!
Message-ID: <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 31, 2023 at 06:09:50PM -0300, Leonardo Br=E1s wrote:
> Hello Paul,
>=20
> I am a newbie Kernel Developer, and I was already a fan of your work on m=
emory-
> barriers.txt.=A0
>=20
> A couple weeks ago a friend of mine recommended reading perfbook,=A0and s=
ent me an
> older version (2011.01.02a). After reading a few pages I went on and foun=
d that
> the book had newer releases and is often updated and maintained with git,=
 which
> got me really impressed.
>=20
> (I had a lot of work gone to waste on other books I found errors on, and
> perfbook's git workflow just make a lot of sense to me)
>=20
> Since it's a topic I am really interested in, and I noticed the book has =
updates
> from a couple days ago, I decided to install texinfo packages and compile=
 a new
> version for me to start reading.=A0
>=20
> I then noticed it would be nice to keep reading the latest version whenev=
er an
> update came by, so I created a gitlab-ci to re-generate the book after a =
new
> commit / push: https://gitlab.com/linux-kernel/perfbook
>=20
> Is that ok if I keep this gitlab repository re-generating the book?
>=20
> Is a gitlab-ci of any use for you?
> If so, I can send it as a patch (a single .gitlab-ci.yaml file), and refi=
ne it
> according to your needs.
>=20
> Thanks for keeping the book updated!

Hello, Leonardo, and glad you like the book!

On the automated CI, I cant't think of a problems with it.  In fact, in
my experience, automated testing is usually a good thing.  I am adding
the perfbook email list in case others have advice or other guidance.

Just out of curiosty, are you thinking of automating tests of the
sample code as well as of the LaTeX builds?

							Thanx, Paul
