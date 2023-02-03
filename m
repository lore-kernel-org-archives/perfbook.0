Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbjBCAFd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 2 Feb 2023 19:05:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16157442CB
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 16:05:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5370361D26
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 00:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675382717;
        bh=Gd2DaEANtO5j+0WqVsrXtMjRrq3pusqysXEL+T81e9g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CMpJ0Cjk7r1pJtHCa6bvUIxxToDyLYjPtYtXORVkP1EXHO6aogUwUCysqQejlxDvH
         mK/kE7qvCXrI+WP1y/6KtxVfRnTQfRMecXMGdI+i7l/gyF73DY82eLS+kAw1NY98MI
         Ke2rvfIC0gYXdck60/wfiGQkAJQbAJFTt78BzjVYck+v4H6ap0kza+xUamj/Kmvl/s
         P0SUqhA0dv7Bwvl0pVEXywW0Tmg0V19EvcZvVjjlFf/IBsBd5RFfB4guLM6QtDa4RK
         I0uquG/fRxJDVinPDyWQTktSxKKdCk36pL1CLUPTMaOKJ1oszTmNcRm379cn+xCAb0
         Hfo+pOvvR6KhA==
Date: Thu, 2 Feb 2023 16:05:17 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
Message-ID: <20230203000517.GB2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
 <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
 <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
 <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
 <20230202233127.GA2948950@paulmck-ThinkPad-P17-Gen-1>
 <4ea57882-933b-431d-45bb-ca822679716a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4ea57882-933b-431d-45bb-ca822679716a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Fri, Feb 03, 2023 at 08:51:04AM +0900, Akira Yokosawa wrote:
> On Thu, 2 Feb 2023 15:31:27 -0800, Paul E. McKenney wrote:
> > On Fri, Feb 03, 2023 at 08:23:05AM +0900, Akira Yokosawa wrote:
> >> Hi,
> >>
> >> On Thu, 02 Feb 2023 13:52:08 -0300, Leonardo Br=E1s wrote:
> >>> On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
> >>>> On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=E1s wrote:
> >>>> [...]
> >>>>>
> >>>>> It looks like it can be done by "Running CI/CD for external reposit=
ories".
> >>>
> >>> Nah, it looks like this won't work either. After my patch on top of m=
aster, it's
> >>> already warning about diverging repositories when I try to sync.
> >>>
> >>> Another solution I could find:
> >>> - Change the patch I sent before to keep the file on another director=
y, even
> >>> with a different name: this will not trigger the build for anyone.
> >>> - Change my repository config to trigger the CI from that file.
> >>>
> >>> The file would only be a random YML file in the repo.
> >>> Would that be ok?
> >>
> >> Hmm, yes, I think I can live with it.
> >>
> >>>
> >>>>>
> >>>>> I removed my previous repository and then imported perfbook again u=
sing the
> >>>>> above mentioned mode. According to the man page, it will run CI for=
 the project
> >>>>> whenever a new push to the referenced repository happens.
> >>>>>
> >>>>> So it's just a matter of waiting a new commit getting push'ed to se=
e if it will
> >>>>> be working.
> >>>>
> >>>> Hi Leonardo,
> >>>>
> >>>> I noticed a minor glitch in the generated PDFs.
> >>>> They don't have Git commit info in the title page and footer area of
> >>>> pages.
> >>>>
> >>>> I can't tell what went wrong, but expected autodate.tex should look =
like:
> >>>
> >>> I found it out: gitlab was doing a shallow clone, and the previous ta=
g was not
> >>> in the commits, so I modified the Gitlab config so it does a complete=
 clone of
> >>> the repository instead.
> >>
> >> Aha!  The script has never tested under a shallow clone...
> >> Let me see if I can improve its behavior.
> >>
> >>> The last output of the pipeline seems to have been correct, please ch=
eck:
> >>> https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifacts/=
browse
> >>
> >> Apparently, the commit id does not make sense in Paul's repo.
> >> But the random YML file approach should resolve it.
> >=20
> > Apologies, I left it untracked.  There is now a Leonardo.2023.02.01a
> > branch that references it.
>=20
> I mean the commit id 81974e57 presented in the artifacts is of the commit
> Leonardo made on his own:
>=20
>     https://gitlab.com/linux-kernel/perfbook/-/commit/81974e57bed4

You are right, that is not the Leonardo.2023.02.01a commit.  Apologies
for my confusion!

							Thanx, Paul
