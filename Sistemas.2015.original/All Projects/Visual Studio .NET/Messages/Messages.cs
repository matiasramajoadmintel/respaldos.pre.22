using System;
using System.Windows.Forms;

namespace ISIS
{
	/// <summary>
	/// Esta clase se utiliza para emitir mensajes al usuario via dialog boxes.
	/// </summary>
	public class Messages
	{
		public static void ShowErrorMessage(string text)
		{
			MessageBox.Show(text, "Error!", MessageBoxButtons.OK, MessageBoxIcon.Error);
		}

		public static bool ConfirmYesNo(string mensaje, string tituloForm)
		{
			if (MessageBox.Show(mensaje, tituloForm, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
				return true;
			else
				return false;
		}

		public static DialogResult ConfirmYesNoCancel(string mensaje, string tituloForm)
		{
			return MessageBox.Show(mensaje, tituloForm, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
		}

		public static void ShowInfoMessage(string mensaje, string tituloForm)
		{
			MessageBox.Show(mensaje, tituloForm, MessageBoxButtons.OK, MessageBoxIcon.Information);
		}
	}
}
