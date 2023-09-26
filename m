Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbjIZSEZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 26 Sep 2023 14:04:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C65D124
        for <perfbook@vger.kernel.org>; Tue, 26 Sep 2023 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695751458;
        bh=i/yPgZf+wq2/c7Nb5VzH1j9AuWy2Co/DXr8vht6yJqU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LG779Tu5OKoSsMZ+QZ8OxCFg3lAdBtcbCyebBnL2CVHPhyLxehC3/zoeh6gjsy4KB
         w3gD+bqNfoRvlC1/1iwSG90S5dh89Qt5aNAbHmLVSYqEHn8UEn1gzBPH2AQxnN3h5r
         qXVNgZptnI7rVAhNVXOyUkTCTbMH18XzudngHXA7TD7VYq5GTSB5lfq/3+QyWyoLY0
         a+p2VH1asmy2iEKT4s+eJRY0YiaTsny8Tq/acSowij8QNCkBp98bWgb1DxGTXHgzsT
         Y+stk/vDGUi6Ga3h+xMiuaHxzTODU9GBCx9O5d+LBmcNn0yASYsE4Ybk4Txm5cRoUG
         2MD+Yoyd3kQyw==
Date: Tue, 26 Sep 2023 11:04:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/4] memorder: Add index markers for
 'address/control/data dependency', take 2
Message-ID: <e1f008ec-1358-4fd7-ab50-abc0fb72439e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
 <a78a4604-cd3f-1adc-320d-2dbedf1f169b@gmail.com>
 <5a2ed909-84c9-4f2d-b598-d0b7442d92f0@paulmck-laptop>
 <5615921f-7c33-bcbe-f076-9ed1cbe900ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5615921f-7c33-bcbe-f076-9ed1cbe900ee@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 26, 2023 at 07:04:12PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On 2023/09/23 17:23, Paul E. McKenney wrote:
> > On Fri, Sep 22, 2023 at 10:55:44PM +0900, Akira Yokosawa wrote:
> [...]
> >>  
> >> -The low overheads of the address and data dependencies discussed in
> >> +The low overheads of the \IXalth{address}{address}{dependency}
> > 
> > This looks strange given the different parameters to the \IXalth above
> > and the \IXalth below, but it gets the right thing to the right place
> > in the index, so I queued and pushed all four.
> > 
> [...]
> >> +and \IXalth{data dependencies}{data}{dependency} discussed in
> 
> Let me explain what's happening here.
> 
> Original sentence looked like this:
> 
>     The low overheads of the address and data dependencies discussed in
> 
> Here, if "address dependencies" were there, I could have said:
> 
>     \IXalth{address dependencies}{address}{dependency}
> 
> Instead, I put an index marker of "Dependency, address" on the lonely
> "address", therefore it became:
> 
>     \IXalth{address}{address}{dependency}
> 
> \IXalth{}{}{} prints any string in #1 with an index marker of
> "#3, #2" put on it.
> 
> Macros of \IX*alt* are powerful and can do whatever you'd like.

Got it, thank you for the explanation!  And indeed they are powerful!

> > Thank you!!!  And yes, I am now generating a set of glossary entries.  ;-)
> 
> Thank you.  I like those cautionary remarks.

Glad you like them!

							Thanx, Paul
