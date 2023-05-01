Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjEATC7 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 May 2023 15:02:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35CC123
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 12:02:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42A8660D54
        for <perfbook@vger.kernel.org>; Mon,  1 May 2023 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682967777;
        bh=bfgnWP1KrfI/M5FqRnpP63o4mUV8LaYAhixXC4EV+BI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rQ5hNgjHZW3CUAPupr0ZlsvAEOOycipiXERsBXJ8VZL9VgiIiV2b55EzgZ4BDPjDB
         O0lOi7xFePuq9O+liAv3AlH3f1CclQ7QiJf10j5f5qT+F9eFd1MPTc2rb2HiKFmN0e
         qWB+pMhC8yFtIK+riuASr/GCb9u7tEg/Z+UYHgyp4OHUF43GIYG+XxZaVmS50xRba1
         uCKHZg2sPpn78puBXljnSJiJdDGIx9wUPxnhK7AqyXHh4wmZQI6iVPAj//oP+rhYtX
         C4hsaYvphy0nXRZeTm/hSRxw42W9pyZSPdvbT7a4Jru6b5nfL7e72OzfJzOupCI/1u
         kzHfKJxCXDyrA==
Date: Mon, 1 May 2023 12:02:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
Message-ID: <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
 <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:
> 
> > 2023年5月1日 下午7:05，Alan Huang <mmpgouride@gmail.com> 写道：
> > 
> > Hi,
> > 
> > I’m reading section 9.5.4.9, in the second to the last paragraph, there is:
> > 
> >  Before the first horizontal line, all readers see the leftmost myconfig structure,
> >  and after the second horizontal line, all readers will see the rightmost structure. 
> >  Between the two lines, that is, during the grace period, different readers might see different objects
> > 
> > I’m a little confused, in Figure 9.29, the xchg is before the first horizontal line, in my understanding, if the 
> > reader’s reading is before the xchg, it will read the leftmost myconfg structure.
> 
> And if reader’s reading is after the xchg, it will see the rightmost structure, and because xchg is before the first horizontal line,
> Readers before the first horizontal line may also see the rightmost structure.
> 
> > 
> > So, are there some conflicts between the paragraph and the figure?
> > 
> > Please correct me if I’m wrong.

Consider the point in time just before the left-hand reader's
rcu_read_unlock() and just after the right-hand reader's rcu_read_lock().
These two readers are both running at that time, and one of those readers
sees the old state and the other sees the new state.

Does that help, or am I missing the point of your question?

							Thanx, Paul
