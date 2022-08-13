Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiHMXMm (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:12:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C550B883D4
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:12:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62E9B60F5F
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660432360;
        bh=iFmwg2Ebv8i20JoWvy96MxqXcz5erryiTAKCrdKOaSY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=BGB2i14pYlxrfZRwPcbvhCVtJb3xZVz3KZXTs3c1myVRWO1moF1SjrOpt4VSThURb
         UwpXcZh+OYpyub8i7n9I3blsaXulAtXDnptu7f0N1hkEp9WBiYXF1xfiGnLTyTADbZ
         gw/OiK7TsdRDcv2eZRhYriG350yTGfMFcS4waxxwNRKyCOlVzCsnwER37zDcGmlM3i
         U0dD5Y12qqJDIlpyYFIhF1Jo3b6UMAu/7KqF7E40Jq9gRYcO6UmK4b3E28gU/8Zn6V
         8erC5Uw6P7KL/70YOE/gOQNCoLR4eLYNGarREjfvjMvOm8IfpY31GNPcotOXOx82Mr
         EdW4dO4AciW+Q==
Date: Sat, 13 Aug 2022 16:12:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 13, 2022 at 07:49:27AM -0400, Elad Lahav wrote:
> On 2022-08-13 07:45, Elad Lahav wrote:
> > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> > ---
> 
> This one will probably require some back-and-forth. If we change it here, do
> other places need to be updated? Have I now removed the explanation of GCC's
> __thread storage class, which will impact the readability of other sections?
> Or are you ready to take the plunge and convert all code snippets?
> 
> For the record, I did build and test count_end.c.

As long as you continue building and testing, checking the descriptions in
text of the code snippets (in case there is a mention of __thread there),
and verifying that the PDF still builds, as fast as you are willing to go!

Are you seeing the same performance with the new as with the old on
your hardware?  (No statistically significant difference on my laptop,
but figured I should ask.)

							Thanx, Paul
