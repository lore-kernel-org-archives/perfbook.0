Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388215AbhASDHv (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 18 Jan 2021 22:07:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F3E20793
        for <perfbook@vger.kernel.org>; Tue, 19 Jan 2021 03:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611025631;
        bh=nsvlOU82MQVpcauPuPKXqWdpiLtvctp8ZLN0CogDSJI=;
        h=Date:From:To:Subject:Reply-To:References:In-Reply-To:From;
        b=fd5jf1B29ruSfKhQql8iw8PqtbxPLMgi0OU7sbgc4jRSGkH0GwtSOyfbHZr+Ymmkn
         GK6doHnmcdVIr4WG/3mkPg6MF9pm3wSxRMp8So+jZTJTXdyN9xfPzJu6fRdpEsMInf
         /DDeTQwdJ+73LAHsqUnf66UAoclA+zVzOMTZTgPVR6ptJhjPxy2hduz61fE/3AQss/
         iHCh3VB6JKeLttSResnofh/RG5IEK8LOBeBP+bINQt3n/7BsYy4uv8IDaX5zUNRKpu
         DL9Ha9obTLiQQtMUTVOAeqYq4iGSnlkGuaGz/keUmZFATSDsDoorx1GjFVE0Fm7maH
         EmK9UArBM19eg==
Date: Mon, 18 Jan 2021 19:07:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Second Edition, Release Candidate 3
Message-ID: <20210119030711.GA7952@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210111173903.GA28842@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111173903.GA28842@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

I pushed the second edition, release candidate 3, which may be found at
tag Edition.2-rc3.  I expect that there will be a number of additional
release candidates while I take a pass through the book, but of course
one fewer than last week.  Again, if you know of issues, please do not
keep them a secret!

							Thanx, Paul
