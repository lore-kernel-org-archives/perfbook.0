Return-Path: <SRS0=j9di=ZB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=D6UuNdsXBYRD9xgh6DIvQ1VGGvEeHLM8y2PjEe3lp54=;
        b=jbTpvWXCnBJQqGqHzNMNTywrBDtxG3d/3E5gqTE1/iWVULLjqBDjLBoWD5NUqz+84X
         JBD9PcU5lX7bug5JA9KWHAPW/P0xyCuyKsHNTuF1y8zzIUXKSAKbBqtrYgiu5gmcW2S6
         Ugn7qx9YRnHfQKiWA/Xgy3w3cFTv4G9zvkIg8uj4KsSRHCCf0PdHuCvrMBmPr82J6S+V
         F52rUrVZpdLzEzeDb4FtViQfXCqkUxV67VEu2tkfsJXiDMy9Tltb2vtPpMjyXAOhuvnV
         kgvoAeXPVrAbyN0MBwwHOjnmYD3bx0OYqV8rCotF1dLq47q8t2XXagYEeG7jwrRN74x+
         xh0w==
Message-ID: <87ebb1a9-edaa-bd37-7207-61b752417ab0@gmail.com>
Date: Tue, 30 Aug 2022 00:19:43 +0900
MIME-Version: 1.0
Subject: Re: Upgraded temporal/spatial discussion
Content-Language: en-US
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, 29 Aug 2022 06:55:33 -0700, Paul E. McKenney wrote:
> Hello, Akira!
> 
> In response to your excellent feedback on my attempt to add a lumber
> analogy to the temporal properties of locking, I have added the
> following commits:
> 
> a7a722ddae4c ("SMPdesign: Work in the spacetime partitioning viewpoint")
> cb7335f0af79 ("locking: Fold saw-kerf section into existing 7.1.4")
> 3d14659144cd ("defer/rcuusage: Relate RCU time/space properties to other primitives")
> 
Thanks for letting me know.

> For completeness, the lumber analogy was attempted in these commits:
> 
> 16131c2c320c ("locking: Add section describing temporal properties of locks")
> 8da652f6c958 ("locking: Add labels to saw-kerf diagram")
> 7f5c537e8a46 ("locking: Wordsmithing")
> 
> If these updates look good to you, I will cut a release.

I'll try to proof-read those commits (hopefully) in a couple of days.

        Thanks, Akira

> 
> 							Thanx, Paul
