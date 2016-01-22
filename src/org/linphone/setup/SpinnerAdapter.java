package org.linphone.setup;

import android.content.Context;
import android.content.ContextWrapper;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import org.linphone.R;

import java.io.File;

/**
 * Created by 3537 on 1/22/2016.
 */
public class SpinnerAdapter extends ArrayAdapter<String> {
	CDNProviders providers;
	Context mContext;
	int[] drawables;
	Uri[] images;
	boolean withText;

	public SpinnerAdapter(Context ctx, int txtViewResourceId,
	                      String[] objects, int[] drawable, boolean withText) {
		super(ctx, txtViewResourceId, objects);
		this.drawables = drawable;
		providers = CDNProviders.getInstance();
		mContext = ctx;
		this.withText = withText;

		ContextWrapper cw = new ContextWrapper(ctx);
		// path to /data/data/yourapp/app_data/imageDir
		File directory = cw.getDir("imageDir", Context.MODE_PRIVATE);
		cw.getDir("imageDir", Context.MODE_PRIVATE);
		images = new Uri[providers.getProvidersCount()];
		for (int i = 0; i < providers.getProvidersCount(); i++) {
			File f = new File(directory, String.valueOf(i) + ".png");//getItemDetailimage());
			if (f.exists()) {
				images[i] = Uri.fromFile(f);
			} else
				images[i] = null;
		}
	}

	@Override
	public int getCount() {
		int count = providers.getProvidersCount();
		return count;
	}

	@Override
	public View getDropDownView(int position, View cnvtView, ViewGroup prnt) {
		return getCustomViewSpinner(position, cnvtView, prnt);
	}

	@Override
	public View getView(int pos, View cnvtView, ViewGroup prnt) {
		return getCustomView(pos, cnvtView, prnt);
	}

	public View getCustomView(int position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = LayoutInflater.from(mContext);
		CDNProviders.Provider tempProvider = providers.getProvider(position);
		View mySpinner;
		if (withText) {
			mySpinner = inflater.inflate(R.layout.spiner_ithem, parent, false);
			TextView main_text = (TextView) mySpinner.findViewById(R.id.txt);
			if (tempProvider != null)
				main_text.setText(tempProvider.getName());
		} else
			mySpinner = inflater.inflate(R.layout.provider_spinner_image_only, parent, false);


		ImageView left_icon = (ImageView) mySpinner.findViewById(R.id.iv);
		if (position < images.length)
			left_icon.setImageURI(images[position]);

		return mySpinner;
	}

	public View getCustomViewSpinner(int position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = LayoutInflater.from(mContext);
		View mySpinner = inflater.inflate(R.layout.spinner_dropdown_item, parent, false);
		CDNProviders.Provider tempProvider = providers.getProvider(position);

		TextView main_text = (TextView) mySpinner.findViewById(R.id.txt);
		if (tempProvider != null) {
			try {
				main_text.setText(tempProvider.getName());
			} catch (IndexOutOfBoundsException e) {
				main_text.setText("");
			}
		}

		ImageView left_icon = (ImageView) mySpinner.findViewById(R.id.iv);
		if (position < images.length)
			left_icon.setImageURI(images[position]);

		return mySpinner;
	}

}

