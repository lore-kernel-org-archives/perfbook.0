Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230116AbhCHQlF (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 8 Mar 2021 11:41:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 415196522B
        for <perfbook@vger.kernel.org>; Mon,  8 Mar 2021 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615221665;
        bh=gKGEWAZHXUAv9WS/6YBPJwUz1vPipbHbbZVbF0bhVAs=;
        h=Date:From:To:Subject:Reply-To:From;
        b=DGLwwBLUIXE4u+zwt2uzNrUGXmT8cA+R246ZTri03XP7MKlLxmkNnth74XWkBB3sT
         fGzGOQaHFPYY8fVHY14w0RxVMYpJheijNVl9HdnbNaDptXh09lo78PVylTJl8eDyq8
         I6WnuM4NLwl5QPPPgOwrBKkoPiKXGaRc9BHwPfKVoUgCD5l5U68adVD5XnCx3kLDxt
         P94XFwwCPUE/3MrLVdSvMV6LSkaU9lyB9kskpDbbuoXINvyX4Zhc9w6KFxVwxZd9we
         UrXDRh6mGn0k9ZdSKdZch2z6ZATpzyzLe9WnpXfhJ8dvFp7vQejUZ4QzfjiUhOeyM3
         C5t76GQu9uliA==
Date: Mon, 8 Mar 2021 08:41:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Second edition coming up soon!
Message-ID: <20210308164105.GA2210@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

Had I been living right, I would have been announcing the Second Edition's
release candidates on this list.  Hopefully better late than never...

The Second Edition Release Candidate 10 is available here:

https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html

There are only a few appendices to go, as I am not going to do an update
of Appendix B or C.  So it is likely that the Second Edition will be
released this coming weekend (of March 14).

So if you see anything needing a bit of wordsmithing, please let me know!

							Thanx, Paul
