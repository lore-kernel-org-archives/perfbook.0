Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F212EC088
	for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889834; cv=none; b=hHlLOEdAg2wCqIM2StUygz1HJqvSOOj7dXx5vF2z65Y2AhhpMj3zi2PMuwkO6c/D73CMjAtKuNK3vFV0u/xmwC/mvs3/eWoVwHX7COIRkKyiFb2nNAWbts5l+Z3kv0Iys4OENbQBOqdYcjr/zFFbvLT/XNtPxvmR85JCsJfvUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889834; c=relaxed/simple;
	bh=1deRpdRLYK7nlAX97kV5SUCNIBFJEKq066cSQqiaSvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcAoE80VbM+FmNtKW1foE04yEpCBQJ73DIBZfaPR5EG2L19gsaiqc3lFYHGIbrHM/g0j4xMdRKKLe97HHIJgm7YYBN75nmsj1OnR6upP2yw2TfylLt3TIFi5wMKcgtY718nSToaweuYlOpb6Z9iq8258M7oZjgG/E2f/RahyKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Swg4hj4a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Swg4hj4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B9C4CEE7;
	Sun, 19 Oct 2025 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760889834;
	bh=1deRpdRLYK7nlAX97kV5SUCNIBFJEKq066cSQqiaSvk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Swg4hj4aMQB+zARmwFfuugGpmMc7Mc0Nak1naS+Ybbh1TrTfVyJrkFg6sw3Yiy2+Z
	 D6n46ykrmmeLuprXDMc+H5Y32sbfFTJ+m+2Re1BsvF4tB5yn5XBZQQycnFbVqMwtmB
	 z9wDYXCOYUC4LItkHBkIW2IlLuZvqx9AXuGUvq0O3rBC8b4FE5JiXXq0S2nZ9umJAM
	 0jRDpvzpO3kfPJw75HAR5JF4cpWOORfcpyYdA2xbv7BBBmfxuallnRFtj2ssVqYPFH
	 YCOcElFtVZEwagG9eqCiu7S6daqZYFk8oIS2qDtpv3ZIg00MR2G5f2Jzn1SCVDIdak
	 L+qdP5HM8O/qA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8A892CE0B26; Sun, 19 Oct 2025 09:03:53 -0700 (PDT)
Date: Sun, 19 Oct 2025 09:03:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/2] Work around regression of recent fvextra
Message-ID: <d00c0ed3-7e42-4376-b327-d1433971ce82@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>

On Sun, Oct 19, 2025 at 05:14:01PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Commit cd98035a31bc ("runlatex.sh: Detect fvextra versions with known
> minor regression") did not fix anything.
> 
> Having seen that the regression is spread to a couple of long-term
> support distros (debian:trixie and opensuse/leap:16), I think a
> better approach is to patch the (LaTeX) package on-the-fly.
> 
> Patch 1/2 reverts the first attempt emitting the suggestion only.
> My preference is for you to drop the commit, if it is not too late.
> 
> Patch 2/2 implements the on-the-fly patching of buggy fvextra.

Again, thank you, and again queued and pushed.

I kept the original commit and took your revert because I had already
pushed the original commit and because it is quite possible that your
original commit might be useful to someone else in a different situation.

						Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (2):
>   Revert "runlatex.sh: Detect fvextra versions with known minor
>     regression"
>   Detect buggy fvextra and apply patch on the fly
> 
>  Makefile              |  1 +
>  fixfvextra.ltx        | 11 +++++++++++
>  perfbook-lt.tex       |  7 +++++++
>  utilities/autodate.sh | 17 +++++++++++++++++
>  utilities/runlatex.sh | 16 ----------------
>  5 files changed, 36 insertions(+), 16 deletions(-)
>  create mode 100644 fixfvextra.ltx
> 
> 
> base-commit: cd98035a31bcefff91d221aa25df2b7b98da243d
> -- 
> 2.43.0
> 
