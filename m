Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbjBBXbc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 2 Feb 2023 18:31:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1086183
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 15:31:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5CE4BB82879
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 23:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675380688;
        bh=InzxXqZ4E3L4KiNkRKrh9Sl5ij3o+Ktx5NMDibBzfxc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Ov3mJAHW81lUoxiW9ANlH9YB2gsL+egnLF7xJ74h1C+O0YALW5jnjXkhGQvB0B6Eg
         KfNCjLqqZw0xHs+cJy7++dLzeyVqNElNK6+A0UXPr7WiNkmswH+RSpRgyugU195vjf
         L9ygVMW9FYCICwEUL85JUeHommhJdq8zpGn/g4xUQbNSFRHMvrNrDRvMEjybIJGpGT
         S5cNFk/bHkpAR/HOlMKtVD8GCu4H66df5SEYgHzhngfAC2bB3FMjDf59j4IbhO+gaN
         LN2vOdrB1rJ0uz2ecUimIs+fldj1z+jom7+1CmnQ5vHw801zVzwSvWC7p53nQihKx9
         CdOICpZVVVO0Q==
Date: Thu, 2 Feb 2023 15:31:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
Message-ID: <20230202233127.GA2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230201201529.901316-1-leobras.c@gmail.com>
 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
 <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
 <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
 <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Fri, Feb 03, 2023 at 08:23:05AM +0900, Akira Yokosawa wrote:
> Hi,
>=20
> On Thu, 02 Feb 2023 13:52:08 -0300, Leonardo Br=E1s wrote:
> > On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
> >> On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=E1s wrote:
> >> [...]
> >>>
> >>> It looks like it can be done by "Running CI/CD for external repositor=
ies".
> >=20
> > Nah, it looks like this won't work either. After my patch on top of mas=
ter, it's
> > already warning about diverging repositories when I try to sync.
> >=20
> > Another solution I could find:
> > - Change the patch I sent before to keep the file on another directory,=
 even
> > with a different name: this will not trigger the build for anyone.
> > - Change my repository config to trigger the CI from that file.
> >=20
> > The file would only be a random YML file in the repo.
> > Would that be ok?
>=20
> Hmm, yes, I think I can live with it.
>=20
> >=20
> >>>
> >>> I removed my previous repository and then imported perfbook again usi=
ng the
> >>> above mentioned mode. According to the man page, it will run CI for t=
he project
> >>> whenever a new push to the referenced repository happens.
> >>>
> >>> So it's just a matter of waiting a new commit getting push'ed to see =
if it will
> >>> be working.
> >>
> >> Hi Leonardo,
> >>
> >> I noticed a minor glitch in the generated PDFs.
> >> They don't have Git commit info in the title page and footer area of
> >> pages.
> >>
> >> I can't tell what went wrong, but expected autodate.tex should look li=
ke:
> >=20
> > I found it out: gitlab was doing a shallow clone, and the previous tag =
was not
> > in the commits, so I modified the Gitlab config so it does a complete c=
lone of
> > the repository instead.
>=20
> Aha!  The script has never tested under a shallow clone...
> Let me see if I can improve its behavior.
>=20
> > The last output of the pipeline seems to have been correct, please chec=
k:
> > https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifacts/br=
owse
>=20
> Apparently, the commit id does not make sense in Paul's repo.
> But the random YML file approach should resolve it.

Apologies, I left it untracked.  There is now a Leonardo.2023.02.01a
branch that references it.

							Thanx, Paul
