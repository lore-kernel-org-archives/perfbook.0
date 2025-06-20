Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F0425E479
	for <perfbook@vger.kernel.org>; Fri, 20 Jun 2025 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418260; cv=none; b=iWFjuVNhjEmXlvygw3ZEqqEW7viRFF+N7WLFxC+LD9iKUQwqB3g6KBRiGplYkWZBk6An/WW1XMhcZgx7KTtH9BE7qhOru+NBX6CNPpl9Luq66MX+E7z8WJ5OB1mCj1kNSG3BoVxSUQOdqqBv5XDhWek7QS/NjedDIJBAPiE+l/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418260; c=relaxed/simple;
	bh=Ra1DBLCmhmgPQSyOckOOUcql0AcZ40zg4wTBxRd74Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h10Xp7OzbhGgBdxsJOy7IzFhQaYnryRY92PXdGuvJoj1DPFDrTrjF5UrFtYytxMDB7qINWyonZjW+h0ZpLANWwcJl14/kupCFGbU6Cg0mvf7UIjfDKJJmzjODAUa/4DIFwreghB12DcML/E204dnqzvDFzaeR3bKRfzFkAuybzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUbWKLmp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUbWKLmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45597C4CEE3;
	Fri, 20 Jun 2025 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418259;
	bh=Ra1DBLCmhmgPQSyOckOOUcql0AcZ40zg4wTBxRd74Yo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hUbWKLmp5pOhpq2K0MUEHxmTkNZabK8nXsIXkTvIYqQ8u4PFl9XWIt994BF+H1xyn
	 HG0IV7puXrUkJQovuj/pix3CfGEbBWISquwq4xgithcTJ+utYYYG1HvjwjMvO83Ib0
	 iq/e1yqgsgoag21IflYVi0P0Csde9Rwqpz56zw0Nc30R8atyzSQpnNNuvOJgNCQnXa
	 3AZ6vPQK2qNq9J+LveDKDJmcrQdMbfwB7U+v0BbT3YKg1+vDRyYxH+YhtkAtprHjK4
	 fsSkBq54WhYIduSaUM8Aef5zdLj9cnZCDvCAzSYK4klQie/UrbHc4WI/a3XTTtCzO/
	 uwyHHItay+v9w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 136A1CE0B9E; Fri, 20 Jun 2025 04:17:37 -0700 (PDT)
Date: Fri, 20 Jun 2025 04:17:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Leonardo Bras <lsoaresp@redhat.com>
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
Message-ID: <291997d0-53f9-4052-a0b3-905b94b746c3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
 <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>
 <53d8230a-adef-4b14-a0cf-96a0d41ae7dc@paulmck-laptop>
 <53199ddf-f7c9-44cd-8fb8-8e4a659353d5@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53199ddf-f7c9-44cd-8fb8-8e4a659353d5@gmail.com>

On Fri, Jun 20, 2025 at 07:41:53PM +0900, Akira Yokosawa wrote:
> On Thu, 19 Jun 2025 23:58:08 -0700, Paul E. McKenney wrote:
> > On Fri, Jun 20, 2025 at 01:44:45PM +0900, Akira Yokosawa wrote:
> >> On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
> >>> Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
> >>>
> >>> Under archlinux-based container runs, non-login shells need to source
> >>> /etc/profile to have package-specific commands such as encguess (under
> >>> /usr/bin/core_perl) appended in its PATH.
> >>>
> >>> Add the command so that the change in commit 00361e8bb1e5 ("Convert
> >>> *.log files into UTF-8 encoding") to work in gitlab-ci builds.
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> Cc: Leonardo Bras <lsoaresp@redhat.com>
> >>> ---
> [...]
> 
> >> Paul, having failed to hear from Leo, can I ask you to take and push this?
> >> I will see the log of Leo's gitlab-CI job once it finishes.
> > 
> > Done!  And I will of course be happy to take any updates that might
> > prove necessary.
> 
> Leo's gitlab-CI have finished successfully.  All looks good!

Very good, and thank you!

							Thanx, Paul
