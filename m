Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468365237
	for <perfbook@vger.kernel.org>; Thu, 23 Nov 2023 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DafwXx6w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBA6C433C7;
	Thu, 23 Nov 2023 02:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707619;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=DafwXx6wi/t05FihQ0Fl//p2SXlPZaCb9HxIs+/ebre7j7TSzHfbHHwRhp94lC1Gy
	 +YQ7CAlpdKnKWyMZj3oN3sWdKY5Uwe87MQXtFfVcJjeUgnk/l0i62mRIcNKrDQfeat
	 62o9Ay7DazbmQbHm9jd9g4MheM+wvR7rqFjpEzHU=
Date: Wed, 22 Nov 2023 21:46:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: perfbook@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-wandering-true-dalmatian-dbaaef@nitro>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K
